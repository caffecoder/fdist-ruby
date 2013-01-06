# @author: Adam Kubica (caffecoder) <caffecoder@kaizen-step.com>
#
class FileDistribution
    def initialize(prefix)
        @ext = '.dat'
        @path = File.expand_path(prefix)
    end

    def set_extension(ext)
        if ext.length > 0 && ext.chars.first != '.'
            @ext = '.' + ext
        else
            @ext = ext
        end
    end

    def get_path
        @path
    end

    def hex_path(id)
        hex = "%x" % id
        hex = '0%s' % hex if hex.length % 2 != 0
        @path = File.join(@path,hex.scan(/../))
        @path += @ext
    end

    def rename_from(path)
        if !File.exists?(File.dirname(@path))
            Dir.mkdir(File.dirname(@path))
        end

        File.rename(path,@path)
    end
end
