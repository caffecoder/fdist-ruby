# @author: Adam Kubica (caffecoder) <caffecoder@kaizen-step.com>
#

require "file_distribution"
require "test/unit"

class TestFileDistribution < Test::Unit::TestCase
 
  def setup
  	@fd = FileDistribution.new("/tmp//")
  end

  def test_path
  	assert_equal("/tmp",@fd.get_path())
  end 

  def test_case1
	@fd.set_extension("tmp")
	@fd.set_extension(".dat")
	@fd.hex_path(102423)
	assert_equal("/tmp/01/90/17.dat",@fd.get_path())
  end 

  def test_case2
	@fd.set_extension("dat")
	@fd.hex_path(256)
	assert_equal("/tmp/01/00.dat",@fd.get_path())
  end

  def test_case3
	@fd.set_extension("")
	@fd.hex_path(256)
	assert_equal("/tmp/01/00",@fd.get_path())
  end 

  def test_case4
	@fd.hex_path(1)
	assert_equal("/tmp/01.dat",@fd.get_path())
  end 

  def test_case5
	f = File.open('/tmp/test.txt', 'w')
	f.close()
	
	assert_equal(true,File.exists?("/tmp/test.txt"))

	@fd.set_extension(".dat")
	@fd.hex_path(256)

	@fd.rename_from("/tmp/test.txt")
	assert_equal(true,File.exists?("/tmp/01/00.dat"))
  end 	

  def teardown
  end
end