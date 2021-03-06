require_relative "test_helper"

class TensorCreationTest < Minitest::Test
  def test_arange
    assert_equal [0, 1, 2, 3, 4], Torch.arange(5).to_a
    assert_equal [1, 2, 3], Torch.arange(1, 4).to_a
    assert_equal [1, 1.5, 2], Torch.arange(1, 2.5, 0.5).to_a
  end

  def test_empty
    assert_equal [2, 3], Torch.empty(2, 3).shape
  end

  def test_empty_like
    input = Torch.empty(2, 3)
    assert_equal [2, 3], Torch.empty_like(input).shape
  end

  def test_eye
    assert_equal [[1, 0], [0, 1]], Torch.eye(2).to_a
    assert_equal [[1, 0, 0], [0, 1, 0]], Torch.eye(2, 3).to_a
  end

  def test_full
    assert_equal [[5, 5, 5], [5, 5, 5]], Torch.full([2, 3], 5).to_a
  end

  def test_full_like
    input = Torch.empty(2, 3)
    assert_equal [[5, 5, 5], [5, 5, 5]], Torch.full_like(input, 5).to_a
  end

  def test_linspace
    assert_equal [3, 4.75, 6.5, 8.25, 10], Torch.linspace(3, 10, 5).to_a
    assert_equal [-10, -5, 0, 5, 10], Torch.linspace(-10, 10, 5).to_a
    assert_equal [-10], Torch.linspace(-10, 10, 1).to_a
  end

  def test_logspace
    assert_elements_in_delta [1e-10, 1e-5, 1, 1e5, 1e10], Torch.logspace(-10, 10, 5).to_a
    assert_elements_in_delta [1.2589, 2.1135, 3.5481, 5.9566, 10.0000], Torch.logspace(0.1, 1.0, 5).to_a
    assert_elements_in_delta [1.2589], Torch.logspace(0.1, 1.0, 1).to_a
    assert_elements_in_delta [4], Torch.logspace(2, 2, 1, 2).to_a
  end

  def test_ones
    assert_equal [[1, 1, 1], [1, 1, 1]], Torch.ones(2, 3).to_a
    assert_equal [1, 1, 1, 1, 1], Torch.ones(5).to_a
  end

  def test_ones_like
    input = Torch.empty(2, 3)
    assert_equal [[1, 1, 1], [1, 1, 1]], Torch.ones_like(input).to_a
  end

  def test_rand
    assert_equal [4], Torch.rand(4).size
    assert_equal [2, 3], Torch.rand(2, 3).size
  end

  def test_rand_like
    input = Torch.empty(2, 3)
    assert_equal [2, 3], Torch.rand_like(input).size
  end

  def test_randint
    assert_equal [3], Torch.randint(3, 5, [3]).size
    assert_equal [2, 2], Torch.randint(3, [2, 2]).size
    assert_equal [2, 2], Torch.randint(3, 10, [2, 2]).size
  end

  def test_randint_like
    input = Torch.empty(2, 2)
    assert_equal [2, 2], Torch.randint_like(input, 3).size
  end

  def test_randn
    assert_equal [4], Torch.randn(4).size
    assert_equal [2, 3], Torch.randn(2, 3).size
  end

  def test_randn_like
    input = Torch.empty(2, 3)
    assert_equal [2, 3], Torch.randn_like(input).size
  end

  def test_randperm
    assert_equal [0, 1, 2, 3], Torch.randperm(4).to_a.sort
  end

  def test_zeros
    assert_equal [[0, 0, 0], [0, 0, 0]], Torch.zeros(2, 3).to_a
    assert_equal [0, 0, 0, 0, 0], Torch.zeros(5).to_a
  end

  def test_zeros_like
    input = Torch.empty(2, 3)
    assert_equal [[0, 0, 0], [0, 0, 0]], Torch.zeros_like(input).to_a
  end
end
