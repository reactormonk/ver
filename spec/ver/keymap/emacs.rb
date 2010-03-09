require_relative '../../helper'

shared :with_buffer do
  before do
    @buffer ||= VER::Buffer.new
    @buffer.value = <<-TEXT
Fugiat eos voluptatum officia fugit ad sit qui.
Alias et voluptas sapiente sed.
Unde ut qui esse repellendus sunt dolorum officia.
Officia accusamus perferendis ab.
Nesciunt repellendus et recusandae dolorum quis repudiandae ad minima.
Ducimus quo et ea.
Qui cumque blanditiis aliquam accusamus perspiciatis provident sapiente fuga.
    TEXT
    @buffer.insert = '1.0'
    @buffer.major_mode = VER::MajorMode[:Fundamental]
    @insert = @buffer.at_insert
  end

  after do
    @buffer.value = ''
  end

  def buffer
    @buffer
  end

  def insert
    @insert
  end

  def type(string)
    buffer.type(string)
  end

  def minibuf
    buffer.minibuf
  end

  def clipboard
    VER::Clipboard.get
  end

  def clipboard_set(string)
    VER::Clipboard.set(string)
  end
end

shared :control_mode do
  behaves_like :with_buffer

  before do
    buffer.minor_mode?(:insert).should == nil
    clipboard_set 'foo'
  end
end

VER.spec keymap: 'emacs' do
  describe 'Keymap for Emacs' do
    describe 'movement' do
      behaves_like :with_buffer

      it 'goes to end of buffer with <Alt-greater>' do
        type '<Alt-greater>'
        insert.should == 'end - 1 chars'
      end

      it 'goes to start of buffer with <Alt-less>' do
        buffer.insert = 'end'
        type '<Alt-less>'
        insert.should == '1.0'
      end

      it 'goes to next char with <Control-f> and <Right>' do
        type '<Control-f>'
        insert.should == '1.1'
        type '<Right>'
        insert.should == '1.2'
      end

      it 'goes to previous char with <Control-b> and <Left>' do
        buffer.insert = '1.5'
        type '<Control-b>'
        insert.should == '1.4'
        type '<Left>'
        insert.should == '1.3'
      end

      it 'goes to next line with <Control-n>, <Down>' do
        type '<Control-n>'
        buffer.count('1.0', 'insert', :displaylines).should == 1
        type '<Down>'
        buffer.count('1.0', 'insert', :displaylines).should == 2
      end

      it 'goes to next page with <Control-v> and <Next>' do
        type '<Control-v>'
        buffer.count('1.0', 'insert', :displaylines).should == 1
        type '<Next>'
        buffer.count('1.0', 'insert', :displaylines).should == 2
      end

      it 'goes to next word with <Alt-f>' do
        type '<Alt-f>'
        insert.index.should == '1.7'
      end

      it 'goes to prev line with <Control-p> and <Up>' do
        insert.index = 'end'
        type '<Control-p>'
        buffer.count('insert', 'end', :displaylines).should == 2
        type '<Up>'
        buffer.count('insert', 'end', :displaylines).should == 3
      end

      it 'goes to prev page with <Alt-V> and <Prior>' do
        insert.index = 'end'
        type '<Alt-V>'
        insert.index.should == '8.0'
        type '<Prior>'
        insert.index.should == '8.0'
      end

      it 'goes to prev word with <Alt-b> and <Shift-Left>' do
        insert.index = '1.10'
        type '<Alt-b>'
        insert.index.should == '1.7'
      end

      it 'goes to start of line with <Control-a> and <Home>' do
        insert.index = '1.10'
        type '<Control-a>'
        insert.index.should == '1.0'
        insert.index = '1.15'
        type '<Home>'
        insert.index.should == '1.0'
      end

      it 'goes at end of line with <Control-e>' do
        type '<Control-e>'
        insert.should == '1.0 lineend'
      end

      it 'goes at end of line with <End>' do
        type '<End>'
        insert.should == '1.0 lineend'
      end

      # it 'goes to next sentence with <Alt-e>' do
      # end
    end
  end
end
