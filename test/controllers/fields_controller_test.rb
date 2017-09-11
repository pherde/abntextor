require 'test_helper'

class FieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @field = fields(:one)
  end

  test "should get index" do
    get fields_url
    assert_response :success
  end

  test "should get new" do
    get new_field_url
    assert_response :success
  end

  test "should create field" do
    assert_difference('Field.count') do
      post fields_url, params: { field: { close_tag: @field.close_tag, label: @field.label, name: @field.name, open_tag: @field.open_tag, position: @field.position, section_id: @field.section_id } }
    end

    assert_redirected_to field_url(Field.last)
  end

  test "should show field" do
    get field_url(@field)
    assert_response :success
  end

  test "should get edit" do
    get edit_field_url(@field)
    assert_response :success
  end

  test "should update field" do
    patch field_url(@field), params: { field: { close_tag: @field.close_tag, label: @field.label, name: @field.name, open_tag: @field.open_tag, position: @field.position, section_id: @field.section_id } }
    assert_redirected_to field_url(@field)
  end

  test "should destroy field" do
    assert_difference('Field.count', -1) do
      delete field_url(@field)
    end

    assert_redirected_to fields_url
  end
end
