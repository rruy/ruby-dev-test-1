class FileBase
  attr_accessor :provider, :file_storage

  def initialize(file_storage)
    @file_storage = file_storage
    set_provider
  end

  def save
    raise NotImplementedError, 'Ask the subclass'
  end

  def destroy
    raise NotImplementedError, 'Ask the subclass'
  end

  def find
    raise NotImplementedError, 'Ask the subclass'
  end

  private 

  def set_provider; end
  
end