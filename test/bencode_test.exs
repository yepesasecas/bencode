defmodule BencodeTest do
  use ExUnit.Case
  doctest Bencode

  test "Test i10e" do
	assert Bencode.parse("i10e") == 10
  end

  test "Test le" do
	assert Bencode.parse("le") == []
  end

  test "Test li10ee" do
	assert Bencode.parse("li10ee") == [10]
  end

  test "Test li10ei15ee" do
	assert Bencode.parse("li10ei15ee") == [10,15]
  end

  test "Test lleli8eee" do
	assert Bencode.parse("lleli8eee") == [[],[8]]
  end

  # test "Test llei3ei1ee" do
  # 	assert Bencode.parse("llei3ei1ee") == [[], 3, 1]
  # end
end
