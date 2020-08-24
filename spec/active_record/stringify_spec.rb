require 'spec_helper'

describe StringifyDate::ActiveRecord::Stringify do
  before { Time.zone = 'Eastern Time (US & Canada)' }

  let(:test_date) do
    TestDate.new(start_at: Date.today, end_at: DateTime.now)
  end

  let(:test_date_string) do
    TestDate.new(start_at_string: Date.today.to_s, end_at_string: DateTime.now.to_s)
  end

  it 'responds to #stringify' do
    expect(TestDate).to respond_to(:stringify)
  end

  it 'responds to _string and _string=' do
    expect(test_date).to respond_to(:start_at_string)
    expect(test_date).to respond_to(:start_at_string=)
    expect(test_date).to respond_to(:end_at_string)
    expect(test_date).to respond_to(:end_at_string=)
    expect(test_date).to respond_to(:published_at_string)
    expect(test_date).to respond_to(:published_at_string=)
  end

  it 'sets start_at_string to 22/10/2012 when start_at 2012-10-22 and stringify format is "%d/%m/%Y"' do
    test_date.start_at = Date.new(2012, 10, 22)

    expect(test_date.start_at_string).to eq('22/10/2012')
  end

  it 'is invalid when parse invalid date' do
    test_date.start_at_string = 'invalid'

    expect(test_date.valid?).to be(false)
  end

  it 'real attribute is nil when parse invalid date' do
    test_date.start_at_string = 'invalid'

    expect(test_date.start_at).to be(nil)
  end

  it 'is valid when parse empty string' do
    test_date.start_at_string = ''

    expect(test_date.valid?).to be(true)
  end

  it 'sets start_at to 31/10/2001 when start_at 2001-02-03 and stringify format is "%d/%m/%Y %H:%M:%S"' do
    test_date.start_at_string = '31/10/2001 02:02:02'

    expect(test_date.start_at).to eq(Date.new(2001, 10, 31))
  end

  it 'sets end_at to 31/10/2001 when start_at 2001-02-03 and stringify format is "%d/%m/%Y %H:%M:%S"' do
    test_date.end_at_string = '31/10/2001 02:02:02 -0300'

    expect(test_date.end_at).to eq(Time.new(2001, 10, 31, 2, 2, 2, '-05:00'))
  end

  it 'sets end_at to 31/10/2001 when start_at 2001-02-03 and stringify format is "%d/%m/%Y %H:%M:%S"' do
    test_date.end_at_string = '31/10/2001 00:00:00 -0300'

    expect(test_date.end_at).to eq(Time.new(2001, 10, 31, 0, 0, 0, '-05:00'))
  end

  it 'sets published_at_string to 2001-02-03 when published_at 2001-02-03 and stringify format is not passing' do
    test_date.published_at = DateTime.new(2001, 2, 3)

    expect(test_date.published_at_string).to eq('2001-02-03')
  end

  it 'sets end_at_string to 22/10/2001 when start_at 2001-02-03 and stringify format is "%d/%m/%Y %H:%M:%S"' do
    test_date.end_at = Date.new(2001, 2, 3)

    expect(test_date.end_at_string).to eq('03/02/2001 00:00:00')
  end

  it 'sets end_at_string to 31/10/2002 when start_at 2001-02-03 and stringify format is "%d/%m/%Y %H:%M:%S"' do
    test_date.end_at = Time.new(2002, 10, 31, 2, 2, 2, '-05:00')

    expect(test_date.end_at_string).to eq('31/10/2002 02:02:02')
  end
end
