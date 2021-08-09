require "Dog"
require "../src/Cat"
require "spec"

describe "File loading" do
  it "adds the local lib directory to the load path" do
    dog = Dog.new

    dog.bark.should eq("Yiff!")
  end

  it "allows for relative loading" do
    cat = Cat.new

    cat.meow.should eq("Miaowww!")
  end
end
