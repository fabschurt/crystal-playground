require "spec"

enum BookType
  COMICS
  MANGA
  COLLECTOR
  NOVEL
end

struct Name
  @value : String

  def initialize(value : String)
    if value == ""
      raise ArgumentError.new("A name cannot be empty.")
    end

    @value = value
  end

  def to_s(io : IO)
    io << @value
  end
end

struct Author
  @first_name : Name
  @last_name : Name

  def initialize(
    @first_name : Name,
    @last_name : Name,
  ) end

  def to_s(io : IO)
    io << "#{@first_name} #{@last_name}"
  end
end

struct Book
  getter type, title, authors

  @type : BookType
  @title: Name
  @authors : Array(Author)

  def initialize(
    @type : BookType,
    @title : Name,
    @authors : Array(Author),
  ) end

  def to_s(io : IO)
    io << "#{@title} (#{@authors.join(", ")})"
  end
end

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

    "#{subject}".should eq "Michel René"
  end

  it "cannot be empty" do
    expect_raises(ArgumentError) { Name.new("") }
  end
end

describe Author do
  it "is a stringable VO" do
    subject = Author.new(
      Name.new("Lewis"),
      Name.new("Trondheim"),
    )

    "#{subject}".should eq "Lewis Trondheim"
  end
end

describe Book do
  it "is a stringable VO" do
    subject = create_book

    "#{subject}".should eq "Cœur de canard (Lewis Trondheim, Joann Sfar)"
  end

  it "exposes some state" do
    subject = create_book

    subject.type.should eq BookType::COMICS
    subject.title.should eq Name.new("Cœur de canard")
    subject.authors.should eq [
      Author.new(
        Name.new("Lewis"),
        Name.new("Trondheim"),
      ),
      Author.new(
        Name.new("Joann"),
        Name.new("Sfar"),
      ),
    ]
  end
end
