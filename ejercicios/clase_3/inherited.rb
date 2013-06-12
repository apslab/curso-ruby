class DocumentExport
	class << self
		attr_reader :export_classes
	end

	@export_classes = []

	def self.export(type, document)
		exporter = export_classes.find do |exporter|
			exporter.can_export?(type)
		end
		return exporter.new(document).export if exporter
		nil
	end

	def self.inherited(subclass)
		DocumentExport.export_classes << subclass
	end

end

class XMLExporter < DocumentExport
	def self.can_export?(type)
		type.to_sym == :xml
	end

	def initialize(document)
		@document = document
	end

	def export
		"<xml>#{@document}</xml>"
	end
end

class JSONExporter < DocumentExport
	def self.can_export?(type)
		type.to_sym == :json
	end

	def initialize(document)
		@document = document
	end

	def export
		"{ object: 'document', document: '#{@document}' }"
	end
end