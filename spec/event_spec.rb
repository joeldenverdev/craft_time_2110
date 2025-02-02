require './lib/person'
require './lib/craft'
require './lib/event'

describe Event do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
    # @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    # @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    # @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    # @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    # @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
  end

  describe '#initialize' do
    it 'returns an instance of Event' do
      expect(@event).to be_a Event
    end

    it 'stores and returns the events name' do
      expect(@event.name).to eq("Carla's Craft Connection")
    end

    it 'returns the crafts at the event' do
      expect(@event.name).to eq("Carla's Craft Connection")
    end

    it 'returns the attendees' do
      expect(@event.attendees).to eq([@person])
    end
  end

  describe '#add_supply' do
    it 'adds supplies and #supplies returns the changes' do
      @person.add_supply('fabric', 4)
      @person.add_supply('scissors', 1)
      expect(@person.supplies).to eq({"fabric"=>4, "scissors"=>1})
      @person.add_supply('fabric', 3)
      expect(@person.supplies).to eq({"fabric"=>7, "scissors"=>1})
    end
  end

  # before(:each) do
  #   @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  #   @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
  #   @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
  #   @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  #   @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
  # end

  describe '#attendee_names' do
    it 'returns the name of the attendees' do
      @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
      expect(@event.attendee_names).to eq(["Hector", "Toni"])
    end
  end

  describe '#craft_with_most_supplies' do
     it 'returns the craft with the most needed supplies' do
       @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
       @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
       @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
       expect(@event.craft_with_most_supplies).to eq("sewing")
     end
  end

  describe '#supply_list' do
    it 'returns the list of all supplies needed' do
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
      expected = ["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"]
      expect(@event.supply_list).to eq(expected)
    end
  end

  describe '#can_build?' do
    it 'returns a boolean response if there are enough supplies to do the craft' do
      @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
      expected = ["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"]
      @hector.add_supply('fabric', 7)
      @hector.add_supply('thread', 1)
      @hector.add_supply('scissors', 1)
      @hector.add_supply('sewing_needles', 1)
      expect(@event.can_build?(@sewing)).to be true
    end
  end

  xdescribe '#atendees_by_craft_interest' do
    it 'returns a boolean response if there are enough supplies to do the craft' do
      @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
      expected = ["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"]
      @hector.add_supply('fabric', 7)
      @hector.add_supply('thread', 1)
      @hector.add_supply('scissors', 1)
      @hector.add_supply('sewing_needles', 1)
      expect(@event.attendees_by_craft_interest).to eq()
    end
  end

end
