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

  def initialize(@first_name : Name, @last_name : Name)
  end

  def to_s(io : IO)
    io << "#{@first_name} #{@last_name}"
  end
end

struct Book
  getter type, title, authors

  @type : BookType
  @title: Name
  @authors : Array(Author)

  def initialize(@type : BookType, @title : Name, @authors : Array(Author))
  end

  def to_s(io : IO)
    io << "#{@title} (#{@authors.join(", ")})"
  end
end

good_book = Book.new(
  type: BookType::NOVEL,
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

puts "#{good_book}" # "Cœur de canard (Lewis Trondheim, Joann Sfar)"
