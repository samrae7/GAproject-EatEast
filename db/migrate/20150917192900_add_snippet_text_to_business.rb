class AddSnippetTextToBusiness < ActiveRecord::Migration
  def change
    add_column(:businesses, :snippet_text, :string)

  end
end
