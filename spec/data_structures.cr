require "spec"
require "data_structures"

def create_book
  Book.new(
    type: BookType::COMICS,
    title: Name.new("Cœur de canard"),
    authors: [
      Author.new(
        Name.new("Lewis"),
        Name.new("Trondheim"),
      ),
      Author.new(
        Name.new("Joann"),
        Name.new("Sfar"),
      ),
    ],
  )
end

describe Name do
  it "is a stringable VO" do
    subject = Name.new("Michel René")

    "#{subject}".should eq("Michel René")
  end

  it "cannot be empty" do
    expect_raises(ArgumentError) do
      Name.new("")
    end
  end
end

describe Author do
  it "is a stringable VO" do
    subject = Author.new(
      Name.new("Lewis"),
      Name.new("Trondheim"),
    )

    "#{subject}".should eq("Lewis Trondheim")
  end
end

describe Book do
  it "is a stringable VO" do
    subject = create_book

    "#{subject}".should eq("Cœur de canard (Lewis Trondheim, Joann Sfar)")
  end

  it "exposes some state" do
    subject = create_book

    subject.type.should eq(BookType::COMICS)
    subject.title.should eq(Name.new("Cœur de canard"))
    subject.authors.should eq([
      Author.new(
        Name.new("Lewis"),
        Name.new("Trondheim"),
      ),
      Author.new(
        Name.new("Joann"),
        Name.new("Sfar"),
      ),
    ])
  end
end
