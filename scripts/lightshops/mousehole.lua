local _, I18N = Kristal.executeLibScript("undertale_monsters_recreation", "scripts/i18n")

local function loc(key, fallback)
    return I18N.loc("umr_mousehole_" .. key, fallback)
end

local MouseHole, super = Class(LightShop)

function MouseHole:init()
    super.init(self)

    -- MAINMENU
    self.menu_options = {
        { "Buy",  "BUYMENU" },
        { "Sell", "SELLMENU" },
        { "Talk", "TALKMENU" },
        { "Exit", "LEAVE" }
    }

    self.encounter_text = loc("encounter", "* Welcome to the Mouse Hole.\n[wait:5]* How can I help ya?")
    self.shop_text = loc("shop", "* Thanks for visiting my little old place.")
    self.leaving_text = loc("leaving", "* Come back any time!")
    self.buy_menu_text = loc("buy_menu", "Here's\nwhat I got.")
    self.buy_confirmation_text = loc("buy_confirmation", "Buy it for\n%s ?")
    self.buy_refuse_text = loc("buy_refuse", "That's too bad.")
    self.buy_text = loc("buy", "Pleasure doin business with ya!")
    self.buy_storage_text = loc("buy_storage", "I put that in your storage for ya!")
    self.buy_too_expensive_text = loc("buy_too_expensive", "Not\nenough\nmoney.")
    self.buy_no_space_text = loc("buy_no_space", "You're\ncarrying\ntoo much.")
    self.sell_menu_text = loc("sell_menu", "I'll take that off ya!")
    self.sell_nothing_text = loc("sell_nothing", "Nothin' there.")
    -- Shown when you sell something
    self.sell_text = loc("sell", "Pleasure doin business with ya!")
    -- Shown when you have nothing in a storage
    self.sell_no_storage_text = loc("sell_no_storage", "* Nothin' there.")
    self.sell_no_storage_encounter_text = loc("sell_no_storage_encounter", "* Nothin' there.")
    self.sell_everything_text = loc("sell_everything", "Nothin' there.")
    -- Shown when you enter the talk menu.
    self.talk_text = loc("talk_menu", "Sure, I\ngot time!")

    self.background = "shops/mousehole_background"
    self.background_speed = 5 / 30
    self.shop_music = "shop"

    self.shopkeeper:setActor("shopkeepers/amelia")
    self.shopkeeper.sprite:setPosition(0, 8)
    self.shopkeeper.slide = true

    self:registerItem("undertale/hush_puppy")

    self.talk_labels = {
        about_self = loc("talk_about_self", "About Yourself"),
        wall_guardian = loc("talk_wall_guardian", "About Wall Guardian"),
        cheese = loc("talk_cheese", "Cheese?"),
        picture_frame = loc("talk_picture_frame", "Picture Frame"),
        together = loc("talk_together", "Together")
    }

    self:registerTalk(self.talk_labels.about_self)
    self:registerTalk(self.talk_labels.wall_guardian)

    self:registerTalkAfter(self.talk_labels.cheese, 1)
    self:registerTalkAfter(self.talk_labels.picture_frame, 2, "talk_2", 1)
    self:registerTalkAfter(self.talk_labels.together, 2, "talk_2", 2)
end

function MouseHole:postInit()
    super.postInit(self)
    self.shopkeeper:setLayer(LIGHT_SHOP_LAYERS["above_boxes"])
end

function MouseHole:startTalk(talk)
    if talk == self.talk_labels.about_self then
        self:startDialogue({
            loc("dialogue_about_self_1", "[emote:idle]* I don't know where to start...\n[wait:5]* I'm just a shopkeeper here in the ridge."),
            loc("dialogue_about_self_2", "[emote:explaining]* I mean, [wait:5]I really like seeing everything that passes through my shop.\n[wait:5]* There's always such interesting things from outsiders!"),
            loc("dialogue_about_self_3", "[emote:happy]* Plus, sometimes they bring a little bit of cheese as a gift!")
        })
    elseif talk == self.talk_labels.cheese then
        self:startDialogue({
            loc("dialogue_cheese_1", "[emote:left]* I, [wait:5]um, [wait:5]really like cheese.\n[wait:5]* It's just the perfect food."),
            loc("dialogue_cheese_2", "[emote:explaining]* Wh-[wait:5]no, [wait:5]I'm not addicted, [wait:5]I can stop any time I want, [wait:5]alright?")
        })
    elseif talk == self.talk_labels.wall_guardian then
        self:setFlag("talk_2", 1)
        self:startDialogue({
            loc("dialogue_wall_guardian_1", "[emote:left]* Wallie? [wait:5]He's a good friend of mine.\n[wait:5]* He's been here for as long as I can remember, [wait:5]even showed me around when I first got here.")
        })
    elseif talk == self.talk_labels.picture_frame then
        self:setFlag("talk_2", 2)
        self:startDialogue({
            loc("dialogue_picture_frame_1", "[emote:left]* Oh, [wait:5]ehehe...\n[wait:5]* I keep forgetting I put that there."),
            loc("dialogue_picture_frame_2", "[emote:idle]* Pay no attention to it,[wait:5] it's just...")
        })
    elseif talk == self.talk_labels.together then
        self:startDialogue({
            loc("dialogue_together_1", "[emote:left]* U-us? [wait:5]No, [wait:5]we're not... [wait:5]I-I mean, [wait:5]there's not much goin' for me."),
            loc("dialogue_together_2", "[emote:happy]* That's all!!")
        })
    end
end

return MouseHole
