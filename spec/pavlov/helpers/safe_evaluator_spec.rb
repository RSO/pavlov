require 'spec_helper'
require 'pavlov/helpers/safe_evaluator'

describe Pavlov::Helpers::SafeEvaluator do
  it 'inititializes correctly' do
    safe_evaluator = Pavlov::Helpers::SafeEvaluator.new mock, mock

    expect(safe_evaluator).to_not eq nil
  end

  it 'pipes setter method calls to target_instance' do
    target_instance = mock
    test = mock
    safe_evaluator = Pavlov::Helpers::SafeEvaluator.new target_instance, mock

    target_instance.should_receive(:public_send).with(:test=, test)

    safe_evaluator.test = test
  end

  it 'pipes getter method calls to caller_instance' do
    caller_instance = mock
    test = mock
    safe_evaluator = Pavlov::Helpers::SafeEvaluator.new mock, caller_instance

    caller_instance.should_receive(:send).with(:test, test)

    safe_evaluator.test test
  end
end
