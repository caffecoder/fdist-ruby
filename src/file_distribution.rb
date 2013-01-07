#
# @author: Adam Kubica (caffecoder) <caffecoder@kaizen-step.com>
#

require "ftools"

#
# Class for manage hashed file distribution.
#
class FileDistribution

    # Creates new instance with directory prefix.
    #
    # Params:
    # - prefix: directory prefix.
    def initialize(prefix)
        @ext = '.dat'
        @path = File.expand_path(prefix)
    end

    # Params:
    # - ext: file extension.
    def set_extension(ext)
        if ext.length > 0 && ext.chars.first != '.'
            @ext = '.' + ext
        else
            @ext = ext
        end
    end

    # Returns Destination path.
    def get_path
        @path
    end

    # Params:
    # - id: database file ID etc.
    def hex_path(id)
        hex = "%x" % id
        hex = '0%s' % hex if hex.length % 2 != 0
        @path = File.join(@path,hex.scan(/../))
        @path += @ext
    end

    # Params:
    # - path: source file path.
    #
    # Raises a SystemCallError if the file cannot be renamed.
    def rename_from(path)
        dst_dir = File.dirname(@path)
        File.mkpath(dst_dir) unless File.exists?(dst_dir)

        File.rename(path,@path)
    end
end
