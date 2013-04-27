#
# @author: Adam Kubica (caffecoder) <caffecoder@kaizen-step.com>
#

require "file_distribution"
require 'fileutils'
require "test/unit"

class TestFileDistribution < Test::Unit::TestCase
 
  def setup
    if not File.exists?("/tmp/ridler")
      FileUtils.mkdir("/tmp/ridler")
    end

    @fd = FileDistribution.new("/tmp/ridler//")
  end

  def test_path
    assert_equal("/tmp/ridler", @fd.get_path())
  end 

  def test_case1
    @fd.set_extension("tmp")
    @fd.set_extension(".dat")
    @fd.hex_path(102423)
    assert_equal("/tmp/ridler/01/90/17.dat", @fd.get_path())
  end 

  def test_case2
    @fd.set_extension("dat")
    @fd.hex_path(256)
    assert_equal("/tmp/ridler/01/00.dat", @fd.get_path())
  end

  def test_case3
    @fd.set_extension("")
    @fd.hex_path(256)
    assert_equal("/tmp/ridler/01/00", @fd.get_path())
  end 

  def test_case4
    @fd.hex_path(1)
    assert_equal("/tmp/ridler/01.dat", @fd.get_path())
  end 

  def test_case5
    f = File.open('/tmp/ridler/test.txt', 'w')
    f.close()

    assert_equal(true, File.exists?("/tmp/ridler/test.txt"))

    @fd.set_extension(".dat")
    @fd.hex_path(256)

    @fd.rename_from("/tmp/ridler/test.txt")
    assert_equal(true, File.exists?("/tmp/ridler/01/00.dat"))
  end 	

  def teardown
    if File.exists?("/tmp/ridler")
      FileUtils.rm_r("/tmp/ridler")
    end
  end
end