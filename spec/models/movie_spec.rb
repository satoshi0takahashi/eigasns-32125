require 'rails_helper'
describe Movie do
  before do
    @movie = FactoryBot.build(:movie)
  end

  describe '映画登録' do
    context '映画登録がうまくいくとき' do
      it '必須項目に入力すれば登録できる' do
        expect(@movie).to be_valid
      end
    end

    context '映画登録がうまくいかないとき' do
      it '商品名がないと登録できない' do
        @movie.name = nil
        @movie.valid?
        expect(@movie.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと登録できない' do
        @movie.detail = nil
        @movie.valid?
        expect(@movie.errors.full_messages).to include("Detail can't be blank")
      end
      it 'カテゴリーの情報がないと登録できない' do
        @movie.category_id = nil
        @movie.valid?
        expect(@movie.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it '映画の種類についての情報がないと登録できない' do
        @movie.country_id = nil
        @movie.valid?
        expect(@movie.errors.full_messages).to include('Country is not a number')
      end
      it '公開日の情報がないと登録できない' do
        @movie.release_date_id = nil
        @movie.valid?
        expect(@movie.errors.full_messages).to include("Release date can't be blank", 'Release date is not a number')
      end
      it 'category_idが1以外でないと登録できない' do
        @movie.category_id = 1
        @movie.valid?
        expect(@movie.errors.full_messages).to include('Category must be other than 1')
      end
      it 'country_idが1以外でないと登録できない' do
        @movie.country_id = 1
        @movie.valid?
        expect(@movie.errors.full_messages).to include('Country must be other than 1')
      end
      it 'release_date_idが1以外でないと登録できない' do
        @movie.release_date_id = 1
        @movie.valid?
        expect(@movie.errors.full_messages).to include('Release date must be other than 1')
      end
    end
  end
end
