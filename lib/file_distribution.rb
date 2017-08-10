#
# @author: Adam Kubica (xcdr) <xcdr@kaizen-step.com>
#

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
    @prefix = File.expand_path(prefix)
    @path = @prefix
  end

  # Params:
  # - ext: file extension.
  def set_extension(ext)
    @ext = ext

    @ext = format('.%s', ext) if !ext.empty? && ext.chars.first != '.'
  end

  # Returns Destination path.
  def get_path
    @path
  end

  # Params:
  # - id: database file ID etc.
  def hex_path(id)
    hex = format('%x', id)
    hex = format('0%s', hex) if hex.length.odd?
    @path = File.join(@prefix, hex.scan(/../))
    @path += @ext
  end

  # Params:
  # - path: source file path.
  #
  # Raise a SystemCallError if the file cannot be renamed.
  def rename_from(path)
    dst_dir = File.dirname(@path)
    FileUtils.mkpath(dst_dir) unless File.exist?(dst_dir)

    File.rename(path, @path)
  end
end
