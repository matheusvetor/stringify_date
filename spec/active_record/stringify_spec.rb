require 'spec_helper'

describe StringifyDate::ActiveRecord::Stringify do

  let(:test_date) do
    TestDate.new(start_at: Date.today, end_at: DateTime.now)
  end

  let(:test_date_string) do
    TestDate.new(start_at_string: Date.today.to_s, end_at_string: DateTime.now.to_s)
  end

  it 'should respond to #stringify' do
    expect(TestDate).to respond_to(:stringify)
  end

  it 'should respond to validity_string and validity_string=' do
    expect(test_date).to respond_to(:start_at_string)
    expect(test_date).to respond_to(:start_at_string=)
    expect(test_date).to respond_to(:end_at_string)
    expect(test_date).to respond_to(:end_at_string=)
  end

  it "should set start_at_string to 22/10/2012 when start_at 2012-10-22 and stringify format is '%d/%m/%Y'" do
    test_date.start_at = Date.new(2012, 10, 22)

    expect(test_date.start_at_string).to eq('22/10/2012')
  end

  it 'should be invalid when parse invalid date' do
    test_date.start_at_string = 'invalid'

    expect(test_date.valid?).to be(false)
  end

  it 'should be valid when parse empty string' do
    test_date.start_at_string = ''

    expect(test_date.valid?).to be(true)
  end

  it "should set start_at_string to 22/10/2012 when start_at 2001-02-03 and stringify format is '%d/%m/%Y %H:%M:%S'" do
    test_date.end_at = DateTime.new(2001,2,3)

    expect(test_date.end_at_string).to eq('03/02/2001 00:00:00')
  end
end
