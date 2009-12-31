module MongoMapper
  module Grip
   module HasAttachment
      module ClassMethods
        
        def has_grid_attachment name, opts={}
          write_inheritable_attribute(:uploaded_files, {}) if uploaded_files.nil?
          uploaded_files[name] = opts
          
          define_method(name) do
            attachments.find(:first,:conditions=>{:name=>name.to_s})
          end

          define_method("#{name}=") do |new_file| 
            raise InvalidFile unless (new_file.is_a?(File) || new_file.is_a?(Tempfile))

            self['_id']     = Mongo::ObjectID.new if _id.blank?
            new_attachment  = Attachment.find_or_initialize_by_name_and_owner_id(name.to_s,self._id)
            update_attachment_attributes!(new_attachment, new_file, opts)
            self.class.uploaded_files[name][:file] = new_file
          end
                    
        end
        
        def uploaded_files
          read_inheritable_attribute(:uploaded_files)
        end
        
      end
      def self.included(base)
        base.extend ClassMethods
        base.class_eval do
          after_save      :save_attachments
          before_destroy  :destroy_attached_files
          
          many :attachments, :as => :owner, :class_name => "MongoMapper::Grip::Attachment", :dependent => :destroy
        end
      end
      
      def update_attachment_attributes! new_attachment, new_file, opts
        new_attachment.owner_type   = self.class.to_s
        new_attachment.file_name    = File.basename(new_file.path)
        new_attachment.file_size    = File.size(new_file.path)
        new_attachment.content_type = MIME::Types.type_for(new_file.path)
        new_attachment.file         = new_file
        new_attachment.variants     = opts[:variants] || {}
        new_attachment.save!
      end
      
      def save_attachments
        attachments.each do |attachment|
          attachment.variants.each do |variant,dimensions|
            #puts "saving :: #{attachment.name}-#{variant}"
            variant = create_variant(attachment,variant,dimensions)
          end
        end
      end
      
      def create_variant attachment, variant, dimensions
        tmp_file = self.class.uploaded_files[attachment.name.to_sym][:file]
        tmp   = Tempfile.new("#{attachment.name}_#{variant}")
        image = Miso::Image.new(tmp_file.path)
        # 
        # image.crop(dimensions[:width], dimensions[:height])  if opts[:crop]
        # image.fit(dimensions[:width], dimensions[:height])   unless opts[:crop]
        # 
        # image.write(tmp.path)
        # 
        # GridFS::GridStore.open(self.class.database, self["#{attr_name}_#{version}_path"], 'w', :content_type => self["#{attr_name}_content_type"]) do |f|
        #  f.write tmp.read
        # end
      end
      
    end
  end
end