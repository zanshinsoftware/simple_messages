require 'spec_helper'

describe SimpleMessages::Builder do
  before do
    @builder = SimpleMessages::Builder.new header: 'This title my alert message.',
      body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
  end

  it { expect(@builder.header_wrapper).to eq '<h4>This title my alert message.</h4>' }

  it { expect(@builder.close_wrapper).to eq "<button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>" }

  it { expect(@builder.closable?).to eq true }

  it { expect(@builder.has_header?).to eq true }

  it { expect(@builder.to_html).to eq "<div class='alert alert-success alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button><h4>This title my alert message.</h4>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>" }

  context "without close" do
    before do
      @builder.closable = false
    end

    it { expect(@builder.closable?).to eq false }

    it { expect(@builder.to_html).to eq "<div class='alert alert-success' role='alert'><h4>This title my alert message.</h4>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>" }
  end

  context "without header" do
    before do
      @builder.header = nil
    end

    it { expect(@builder.has_header?).to eq false }

    it { expect(@builder.to_html).to eq "<div class='alert alert-success alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>" }

    it { expect(@builder.header_wrapper).to eq nil }
  end

  context "body is a array" do
    before do
      @builder.body = [ 'Line 1.', 'Line 2.' ]
    end

    it { expect(@builder.to_html).to eq "<div class='alert alert-success alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button><h4>This title my alert message.</h4>Line 1.<br />Line 2.</div>" }
  end

  context "notice kind" do
    before do
      @builder.kind = :notice
    end

    it { expect(@builder.to_html).to eq "<div class='alert alert-success alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button><h4>This title my alert message.</h4>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>" }
  end

  context "danger kind" do
    before do
      @builder.kind = :danger
    end

    it { expect(@builder.to_html).to eq "<div class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button><h4>This title my alert message.</h4>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>" }
  end

  context "alert kind" do
    before do
      @builder.kind = :alert
    end

    it { expect(@builder.to_html).to eq "<div class='alert alert-alert alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button><h4>This title my alert message.</h4>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>" }
  end

  context "with html attributes" do
    before do
      @builder.html = { class: 'my-class', id: 'my-id' }
    end

    it { expect(@builder.to_html).to eq "<div class='my-class alert alert-success alert-dismissible' role='alert' id='my-id'><button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button><h4>This title my alert message.</h4>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>" }
  end
end
