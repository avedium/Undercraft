// Give Ring of Seven Curses to player when they receive the Go Deeper advancement
PlayerEvents.advancement(event => {
    if (event.advancement == 'minecraft:story/enter_the_nether') {
        const player = event.player
        
        player.give('enigmaticlegacy:cursed_ring')
        player.tell(Text.red('The ring beckons...'))
    }
})

