require "application_system_test_case"

class PokemonsTest < ApplicationSystemTestCase
  setup do
    @pokemon = pokemons(:one)
  end

  test "visiting the index" do
    visit pokemons_url
    assert_selector "h1", text: "Pokemons"
  end

  test "should create pokemon" do
    visit pokemons_url
    click_on "New pokemon"

    fill_in "Name", with: @pokemon.name
    fill_in "Pokedex-entry", with: @pokemon.pokedex-entry
    fill_in "Region", with: @pokemon.region_id
    fill_in "Types", with: @pokemon.types
    click_on "Create Pokemon"

    assert_text "Pokemon was successfully created"
    click_on "Back"
  end

  test "should update Pokemon" do
    visit pokemon_url(@pokemon)
    click_on "Edit this pokemon", match: :first

    fill_in "Name", with: @pokemon.name
    fill_in "Pokedex-entry", with: @pokemon.pokedex-entry
    fill_in "Region", with: @pokemon.region_id
    fill_in "Types", with: @pokemon.types
    click_on "Update Pokemon"

    assert_text "Pokemon was successfully updated"
    click_on "Back"
  end

  test "should destroy Pokemon" do
    visit pokemon_url(@pokemon)
    click_on "Destroy this pokemon", match: :first

    assert_text "Pokemon was successfully destroyed"
  end
end
