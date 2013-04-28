#
# @author: Adam Kubica (caffecoder) <caffecoder@kaizen-step.com>
#

require 'file_distribution'
require 'fileutils'
require 'test/unit'

class TestFileDistribution < Test::Unit::TestCase
 
  def setup
    if not File.exists?("/tmp/storage")
      FileUtils.mkdir("/tmp/storage")
    end

    @fd = FileDistribution.new("/tmp/storage//")
  end

  def test_path
    assert_equal("/tmp/storage", @fd.get_path())
  end 

  def test_case1
    @fd.set_extension("tmp")
    @fd.set_extension(".dat")
    @fd.hex_path(102423)
    assert_equal("/tmp/storage/01/90/17.dat", @fd.get_path())
  end 

  def test_case2
    @fd.set_extension("dat")
    @fd.hex_path(256)
    assert_equal("/tmp/storage/01/00.dat", @fd.get_path())
  end

  # in most cases this is wrong way
  def test_case3
    @fd.set_extension("")
    @fd.hex_path(256)
    assert_equal("/tmp/storage/01/00", @fd.get_path())
  end 

  def test_case4
    @fd.hex_path(1)
    assert_equal("/tmp/storage/01.dat", @fd.get_path())
  end 

  def test_case5
    f = File.open('/tmp/storage/test.txt', 'w')
    f.close()

    assert_equal(true, File.exists?("/tmp/storage/test.txt"))

    @fd.set_extension(".dat")
    @fd.hex_path(256)

    @fd.rename_from("/tmp/storage/test.txt")
    assert_equal(true, File.exists?("/tmp/storage/01/00.dat"))
  end 	

  def test_case6
    f = File.open('/tmp/storage/test1.txt', 'w')
    f.close()

    f = File.open('/tmp/storage/test2.txt', 'w')
    f.close()

    assert_equal(true, File.exists?("/tmp/storage/test1.txt"))
    assert_equal(true, File.exists?("/tmp/storage/test2.txt"))

    @fd.set_extension(".dat")

    @fd.hex_path(1)
    @fd.rename_from("/tmp/storage/test1.txt")
    assert_equal(true, File.exists?("/tmp/storage/01.dat"))
    
    @fd.hex_path(256)
    @fd.rename_from("/tmp/storage/test2.txt")
    assert_equal(true, File.exists?("/tmp/storage/01/00.dat"))
  end 

  def teardown
    if File.exists?("/tmp/storage")
      FileUtils.rm_r("/tmp/storage")
    end
  end
end