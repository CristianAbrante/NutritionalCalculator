require "spec_helper"

RSpec.describe NutritionalCalculator::LinkedList do

  describe NutritionalCalculator::LinkedList::Node do

    before :each do
      @node1 = NutritionalCalculator::LinkedList::Node.new("a", nil, nil)
      @node2 = NutritionalCalculator::LinkedList::Node.new("b", nil, @node1)
      @node3 = NutritionalCalculator::LinkedList::Node.new("c", nil, @node2)

      @node1.next = @node2
      @node2.next = @node3
    end

    it "probar el enlace al nodo anterior" do
      expect(@node1.prev).to eq(nil)
      expect(@node2.prev).to eq(@node1)
      expect(@node3.prev).to eq(@node2)
    end

    it "probar el valor que contiene el nodo" do
      expect(@node1.value).to eq("a")
      expect(@node2.value).to eq("b")
      expect(@node3.value).to eq("c")
    end

    it "probar el enlace al nodo posterior" do
      expect(@node1.next).to eq(@node2)
      expect(@node2.next).to eq(@node3)
      expect(@node3.next).to eq(nil)
    end
  end

  describe NutritionalCalculator::LinkedList do

    before :each do
      @value_list = NutritionalCalculator::LinkedList.new
    end

    context "inserción de elementos" do
      it "Inserción de un elemento por la cola" do
        @value_list.push_back 1
        @value_list.push_back 2
        @value_list.push_back 3

        expect(@value_list.to_s).to eq("1 <-- 2 <-- 3")
      end

      it "Inserción de un elemento por la cabeza" do
        @value_list.push_front 0
        @value_list.push_front -1
        @value_list.push_front -2

        expect(@value_list.to_s).to eq("-2 <-- -1 <-- 0")
      end

      it "Inserción de varios elementos a la vez" do
        @value_list.insert -2, -1, 0, 1, 2, 3

        expect(@value_list.to_s).to eq("-2 <-- -1 <-- 0 <-- 1 <-- 2 <-- 3")
      end
    end

    context "Extracción de elementos" do

      before :each do
        @value_list.insert -2, -1, 0, 1, 2, 3
      end

      it "Extracción del primer elemento de la lista" do
        @value_list.pop_front
        expect(@value_list.to_s).to eq("-1 <-- 0 <-- 1 <-- 2 <-- 3")
      end

      it "Extracción del último elemento de la lista" do
        @value_list.pop_back
        expect(@value_list.to_s).to eq("-2 <-- -1 <-- 0 <-- 1 <-- 2")
      end

      it "Extracción de un elemento dado un valor" do
        @value_list.erase 0
        expect(@value_list.to_s).to eq("-2 <-- -1 <-- 1 <-- 2 <-- 3")

        @value_list.erase 1
        expect(@value_list.to_s).to eq("-2 <-- -1 <-- 2 <-- 3")
      end
    end

    context "Acceso de elementos" do

      before :each do
        @value_list.insert -2, -1, 0, 1, 2, 3
      end

      it "Acceso al primer elemento de la lista" do
        expect(@value_list.front).to eq(-2)
      end

      it "Acceso alúltimo elemento de la lista" do
        expect(@value_list.back).to eq(3)
      end

      it "Acceso a un elemento dada una posición concreta" do
        expect(@value_list[2]).to eq(0)
      end
    end

    context "Enumeración de elementos" do

      before :each do
        @value_list.insert 1,2,3,4,5
      end

      it "prueba del método each" do
        @value_list.each {|value| puts value}
      end

      it "prueba del método map y collect" do
        list_array = [1,4,9,16,25]
        a = @value_list.map { |i| i*i }
        b = @value_list.collect {|i| i*i}

        expect(list_array == a).to eq(true)
        expect(list_array == b).to eq(true)
      end

      it "prueba del método all?" do
        expect(@value_list.all?).to eq(true)

        falsy_list = NutritionalCalculator::LinkedList.new
        falsy_list.insert(1,2,"a", false, 5, 7)

        expect(falsy_list.all?).to be(false)
      end

      it "Comprobando el método count" do

        count_list = NutritionalCalculator::LinkedList.new
        count_list.insert 2,4,1,5,2

        expect(@value_list.count).to eq(5)
        expect(count_list.count(2)).to eq(2)
        expect(count_list.count {|i| i % 2 == 0}).to eq(3)
      end

      it "Comprobamos el método detect" do
        expect(@value_list.detect {|i| i % 2 == 0}).to eq(2)
        expect(@value_list.detect {|i| i % 7 == 0}).to eq(nil)
      end

      it "Comprobamos el método drop" do
        expect(@value_list.drop(2)).to eq([3, 4, 5])
        expect(@value_list.drop(5)).to eq([])
      end

      it "Comprobamos el método max" do
        expect(@value_list.max).to eq(5)
      end

      it "Comprobamos el método min" do
        expect(@value_list.min).to eq(1)
      end

      it "Comprobamos el método sort" do

        unordered_list = NutritionalCalculator::LinkedList.new
        unordered_list.insert -1, 4, 6, 0, 5, -3, 0

        expect(unordered_list.sort).to eq([-3, -1, 0, 0, 4, 5, 6])

      end

    end

  end

end
