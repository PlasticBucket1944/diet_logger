# 値を確認する場合はputsを利用
# モデルの定の値を確認する場合は @user.pluck(:email) と記述
require 'test_helper'

class CalorieIntakeTest < ActiveSupport::TestCase
  setup do
    # 定義はfixtures/users.ymlに記述
    @user = User.where(id: 1)
  end

  test "CalorieIntake 正常：正常に保存できるか" do
    calorie = CalorieIntake.new(user_id: 1, name: "ラーメン", date: 2021-11-26, amount: 1000)
    assert calorie.valid?
  end

  test "CalorieIntake 異常：存在していないユーザーID" do
    calorie = CalorieIntake.new(user_id: 99999, name: "ラーメン", date: 2021-11-26, amount: 1000)
    assert_not calorie.valid?
  end

  test "CalorieIntake 正常： name最低値" do
    calorie = CalorieIntake.new(user_id: 1, name: "１", date: 2021-11-26, amount: 1000)
    calorie.valid?
    assert_empty calorie.errors[:name]
  end

  test "CalorieIntake 正常： name最高値" do
    calorie = CalorieIntake.new(user_id: 1, name: "１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０", date: 2021-11-26, amount: 1000)
    calorie.valid?
    assert_empty calorie.errors[:name]
  end

  test "CalorieIntake 異常： name最低値未満" do
    calorie = CalorieIntake.new(user_id: 1, name: "", date: 2021-11-26, amount: 1000)
    calorie.valid?
    assert_not_empty calorie.errors[:name]
  end

  test "CalorieIntake 異常： name最高値より大きい" do
    calorie = CalorieIntake.new(user_id: 1, name: "１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１", date: 2021-11-26, amount: 1000)
    calorie.valid?
    assert_not_empty calorie.errors[:name]
  end

  test "CalorieIntake 正常： amount最低値" do
    calorie = CalorieIntake.new(user_id: 1, name: "ラーメン", date: 2021-11-26, amount: 0)
    calorie.valid?
    assert_empty calorie.errors[:amount]
  end

  test "CalorieIntake 正常： amount最高値" do
    calorie = CalorieIntake.new(user_id: 1, name: "ラーメン", date: 2021-11-26, amount: 999999)
    calorie.valid?
    assert_empty calorie.errors[:amount]
  end

  test "CalorieIntake 異常： amount最低値未満" do
    calorie = CalorieIntake.new(user_id: 1, name: "ラーメン", date: 2021-11-26, amount: -1)
    calorie.valid?
    assert_not_empty calorie.errors[:amount]
  end

  test "CalorieIntake 異常： amount最高値より大きい" do
    calorie = CalorieIntake.new(user_id: 1, name: "ラーメン", date: 2021-11-26, amount: 1000000)
    calorie.valid?
    assert_not_empty calorie.errors[:amount]
  end

  test "CalorieIntake 異常： amount小数点" do
    calorie = CalorieIntake.new(user_id: 1, name: "ラーメン", date: 2021-11-26, amount: 1.5)
    calorie.valid?
    assert_not_empty calorie.errors[:amount]
  end
end
