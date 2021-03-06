require_relative "test_helper"

class CUDATest < Minitest::Test
  def test_works
    assert !Torch::CUDA.available?.nil?
    assert Torch::CUDA.device_count
  end

  def test_device
    device = Torch.device("cpu")
    assert_equal "cpu", device.type
    assert !device.index?
  end
end
