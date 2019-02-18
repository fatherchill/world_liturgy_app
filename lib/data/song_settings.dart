import '../model/songBook.dart';
import '../songParse/formats/wlp.dart';
import '../songParse/formats/openSong.dart';

List<SongBook> initializeSongBooks() {
  return [
    SongBook(
      title: 'Tenzi Za Rohoni',
      language: 'sw_ke',
      songFormat: WLPSongBook(path: 'assets/wlp_format/docs/tenziZaRohoni.xml'),
    ),
    SongBook(
        title: 'English Songs and Hymns',
        language: 'en_ke',
        songFormat: OpenSongBook(path: 'assets/songBooks/english_songs/', index: {
          "Better is One Day": "Better is One Day",
          "Glory (Lift Up Your Hands)": "Glory (Lift Up Your Hands)",
          "Stand in Awe": "Stand in Awe",
          "Love Ran Red": "Love Ran Red.xml",
          "Waiting Here For You": "Waiting Here For You.xml",
          "Running in Circles": "Running in Circles",
          "Do It Again": "Do It Again",
          "He Is Lord": "He Is Lord",
          "Great I Am": "Great I Am.xml",
          "Crown Him With Many Crowns": "Crown Him With Many Crowns.xml",
          "Psalm 62": "Psalm 62",
          "Build My Life": "Build My Life",
          "Did You Feel the Mountains Tremble":
              "Did You Feel the Mountains Tremble.xml",
          "Unashamed": "Unashamed.xml",
          "Here in Your Presence": "Here in Your Presence.xml",
          "Here I Am to Worship": "Here I Am to Worship.xml",
          "Oceans (Where Feet May Fall)": "Oceans (Where Feet May Fall).xml",
          "Standing On The Promises": "Standing On The Promises",
          "Fill Me Up": "Fill Me Up.xml",
          "Crowns": "Crowns",
          "Show Me Your Glory": "Show Me Your Glory.xml",
          "Break Every Chain": "Break Every Chain",
          "O Praise the Name - Bethel": "O Praise the Name - Bethel",
          "King of My Heart": "King of My Heart.xml",
          "Humble King": "Humble King.xml",
          "Our God": "Our God.xml",
          "O Praise the Name": "O Praise the Name.xml",
          "Grace So Glorious": "Grace So Glorious",
          "At the Foot Of The Cross": "At the Foot Of The Cross",
          "Mercy": "Mercy",
          "Here for You": "Here for You.xml",
          "Blessed Be Your Name": "Blessed Be Your Name",
          "Hosanna (Praise is Rising)": "Hosanna (Praise is Rising).xml",
          "At the Cross": "At the Cross",
          "Come Thou Fount": "Come Thou Fount",
          "Time Has Come": "Time Has Come",
          "Christ is Enough": "Christ is Enough.xml",
          "Scandal of Grace": "Scandal of Grace.xml",
          "Man Of Sorrows": "Man Of Sorrows.xml",
          "Come Thou Fount (I Will Sing)": "Come Thou Fount (I Will Sing)",
          "Fall Afresh": "Fall Afresh.xml",
          "Good Good Father": "Good Good Father.xml",
          "He Leadeth Me": "He Leadeth Me",
          "Jesus Loves Me": "Jesus Loves Me.xml",
          "Amazed": "Amazed",
          "Christ Arose": "Christ Arose",
          "Miracles": "Miracles.xml",
          "Raised to Life": "Raised to Life",
          "Stronger (There is Love)": "Stronger (There is Love).xml",
          "Doxology": "Doxology.xml",
          "Psalm 19": "Psalm 19.xml",
          "Cry In My Heart": "Cry In My Heart",
          "What A Friend We Have In Jesus": "What A Friend We Have In Jesus",
          "Jesus (Tomlin)": "Jesus (Tomlin).xml",
          "Resurrecting": "Resurrecting.xml",
          "Leaning On The Everlasting Arms": "Leaning On The Everlasting Arms",
          "Glorious Ruins": "Glorious Ruins",
          "Jesus Messiah": "Jesus Messiah.xml",
          "Broken Vessels": "Broken Vessels",
          "Jesus Lover of My Soul": "Jesus Lover of My Soul.xml",
          "How Great is Your Love": "How Great is Your Love",
          "Call Upon the Lord": "Call Upon the Lord",
          "How Great Thou Art": "How Great Thou Art.xml",
          "When We All Get To Heaven": "When We All Get To Heaven",
          "Lord I Need You": "Lord I Need You.xml",
          "Here's My Heart": "Here's My Heart.xml",
          "Forever (Bethel)": "Forever (Bethel).xml",
          "I Have Decided To Follow Jesus": "I Have Decided To Follow Jesus",
          "Forever Reign": "Forever Reign.xml",
          "This is Amazing Grace": "This is Amazing Grace.xml",
          "One Thing": "One Thing.xml",
          "Rescue (Desp": "Rescue (Desp. Band)",
          "Blessed Assurance": "Blessed Assurance",
          "Here as in Heaven": "Here as in Heaven.xml",
          "Great is the Lord": "Great is the Lord",
          "Gracefully Broken": "Gracefully Broken",
          "It's Your Love": "It's Your Love",
          "Behold": "Behold",
          "Give Us Clean Hands": "Give Us Clean Hands.xml",
          "Forever I Run": "Forever I Run",
          "Be Enthroned": "Be Enthroned",
          "Holy Is The Lord": "Holy Is The Lord.xml",
          "Jesus We Enthrone You": "Jesus We Enthrone You.xml",
          "Open the Eyes of My Heart": "Open the Eyes of My Heart.xml",
          "Consuming Fire": "Consuming Fire.xml",
          "Jesus I Come": "Jesus I Come.xml",
          "No Longer Slaves": "No Longer Slaves.xml",
          "Lamb of God": "Lamb of God",
          "All Hail The Power Of Jesus Name":
              "All Hail The Power Of Jesus Name",
          "This is How We Know": "This is How We Know",
          "Came to my Rescue": "Came to my Rescue.xml",
          "Living Hope": "Living Hope",
          "Open Heaven": "Open Heaven.xml",
          "Love Came Down": "Love Came Down.xml",
          "Holy and Annointed One": "Holy and Annointed One.xml",
          "Prince of Peace": "Prince of Peace",
          "Jesus Be The Center": "Jesus Be The Center.xml",
          "This is Our God": "This is Our God",
          "Remain": "Remain",
          "Calvary": "Calvary",
          "The Power of Your Love": "The Power of Your Love.xml",
          "All Glory Be To Christ": "All Glory Be To Christ",
          "Holy Spirit(there's nothing worth more)":
              "Holy Spirit(there's nothing worth more).xml",
          "Sing to the King": "Sing to the King",
          "Grace to Grace": "Grace to Grace.xml",
          "This is Our God (Freely You Gave)":
              "This is Our God (Freely You Gave).xml",
          "Jesus Forever": "Jesus Forever",
          "To the Ends of the Earth": "To the Ends of the Earth.xml",
          "God of Calvary": "God of Calvary.xml",
          "Holy Spirit Extended": "Holy Spirit Extended",
          "All I Have is Christ": "All I Have is Christ",
          "Nothing But The Blood": "Nothing But The Blood.xml",
          "Pieces": "Pieces",
          "I Am Not Alone": "I Am Not Alone",
          "By Our Love": "By Our Love",
          "It Is Well With My Soul": "It Is Well With My Soul",
          "Prince of Peace Hillsong": "Prince of Peace Hillsong",
          "Still": "Still.xml",
          "The Stand": "The Stand.xml",
          "Let There Be Light": "Let There Be Light.xml",
          "Set a Fire": "Set a Fire.xml",
          "Closer": "Closer.xml",
          "Come Thou Long Expected Jesus": "Come Thou Long Expected Jesus.xml",
          "Come As You Are": "Come As You Are.xml",
          "Heart of Worship": "Heart of Worship.xml",
          "Create in Me a Clean Heart": "Create in Me a Clean Heart.xml",
          "Sweetly Broken": "Sweetly Broken",
          "Enough": "Enough",
          "And Can It Be": "And Can It Be",
          "Open Up Our Eyes": "Open Up Our Eyes.xml",
          "The Love of Jesus": "The Love of Jesus",
          "Holy Holy Holy": "Holy Holy Holy",
          "All to Jesus I Surrender": "All to Jesus I Surrender",
          "How Firm A Foundation": "How Firm A Foundation",
          "Jesus Paid it All & Nothing But the Blood":
              "Jesus Paid it All & Nothing But the Blood",
          "Draw me Close to You": "Draw me Close to You.xml",
          "All To Us": "All To Us",
          "God of this City": "God of this City.xml",
          "Back to You": "Back to You",
          "Above All": "Above All",
          "Awesome is the Lord Most High": "Awesome is the Lord Most High",
          "Once Again": "Once Again.xml",
          "Forever (Give Thanks to the Lord)":
              "Forever (Give Thanks to the Lord).xml",
          "Shout to the Lord": "Shout to the Lord",
          "Let Your Glory Fall": "Let Your Glory Fall.xml",
          "From the Inside Out": "From the Inside Out.xml",
          "Center": "Center.xml",
          "Since I Have Been Redeemed": "Since I Have Been Redeemed",
          "In The Garden": "In The Garden",
          "How Great is Our God": "How Great is Our God.xml",
          "How Deep the Father's Love for Us":
              "How Deep the Father's Love for Us.xml",
          "After All These Years": "After All These Years",
          "Great Are You Lord": "Great Are You Lord.xml",
          "Second Chance": "Second Chance",
          "Give Me Jesus": "Give Me Jesus",
          "Future Past": "Future Past",
          "Come Home Running": "Come Home Running.xml",
          "Jesus Paid it All": "Jesus Paid it All.xml",
          "The Solid Rock": "The Solid Rock",
          "The Wonderful Cross": "The Wonderful Cross",
          "Awakening": "Awakening",
          "As We Seek Your Face": "As We Seek Your Face",
          "Undignified_": "Undignified_.xml",
          "Christ Is Risen": "Christ Is Risen.xml",
          "One Voice": "One Voice",
          "Amazing Grace": "Amazing Grace",
          "Fire Fall Down": "Fire Fall Down.xml",
          "Awesome God": "Awesome God",
          "Mighty to Save": "Mighty to Save.xml",
          "Amazing Grace (My Chains are Gone)":
              "Amazing Grace (My Chains are Gone)",
          "All Creatures of Our God and King":
              "All Creatures of Our God and King",
          "Ever Be": "Ever Be.xml",
          "The More I Seek You": "The More I Seek You.xml",
          "Be Thou My Vision": "Be Thou My Vision",
          "Amazing Love": "Amazing Love",
          "God is Able": "God is Able.xml",
          "O Come to the Altar": "O Come to the Altar",
          "Thank You Jesus": "Thank You Jesus.xml",
          "Give Me Faith": "Give Me Faith.xml",
          "Revelation Song": "Revelation Song.xml",
          "Doxology(Chris Cleveland)": "Doxology(Chris Cleveland).xml",
          "Jesus Son of God": "Jesus Son of God",
          "Jesus We Love You": "Jesus We Love You.xml",
          "There is None Like You": "There is None Like You.xml",
          "One Thing Remains": "One Thing Remains.xml",
          "Turn Your Eyes Upon Jesus": "Turn Your Eyes Upon Jesus.xml",
          "This is Living": "This is Living.xml",
          "Jesus I Need You": "Jesus I Need You",
          "Let it Rain": "Let it Rain.xml",
          "Before the Thone": "Before the Thone",
          "Marvelous Light_": "Marvelous Light_.xml",
          "Everlasting God": "Everlasting God.xml",
          "Reign in Us": "Reign in Us.xml",
          "As the Deer": "As the Deer",
          "Are You Washed": "Are You Washed",
          "Cornerstone": "Cornerstone.xml",
          "Jesus Loves Even Me": "Jesus Loves Even Me",
          "Take My Life": "Take My Life.xml",
          "Lord I Give You My Heart": "Lord I Give You My Heart",
          "Filled With Glory": "Filled With Glory",
          "Pursue": "Pursue",
          "10000 Reasons": "10000 Reasons",
          "I Could Sing of Your Love Forever":
              "I Could Sing of Your Love Forever.xml",
          "Jesus Only Jesus": "Jesus Only Jesus.xml",
          "A Mighty Fortress is Our God": "A Mighty Fortress is Our God",
          "How He Loves": "How He Loves.xml",
          "Boldy I Approach": "Boldy I Approach",
          "Let is be Jesus": "Let is be Jesus",
          "This I Believe (The Creed)": "This I Believe (The Creed).xml",
          "Arms Open Wide": "Arms Open Wide",
          "The Nails in Your Hands": "The Nails in Your Hands.xml",
          "Tis so Sweet to Trust in Jesus":
              "Tis so Sweet to Trust in Jesus.xml",
          "All Who Are Thirsty": "All Who Are Thirsty",
          "No Other Name": "No Other Name.xml",
          "Son of God": "Son of God",
          "Great Is Thy Faithfulness": "Great Is Thy Faithfulness.xml",
          "To Worship You I Live": "To Worship You I Live",
          "Lion and the Lamb": "Lion and the Lamb",
          "Hungry (Falling On my Knees)": "Hungry (Falling On y Knees).xml",
          "The Cause of Christ": "The Cause of Christ",
          "Beautiful One": "Beautiful One",
          "Come To The Water": "Come To The Water.xml",
          "Christ is Mine Forevermore": "Christ is Mine Forevermore",
          "Healer": "Healer",
          "Hosanna (I see the King of Glory)":
              "Hosanna (I see the King of Glory).xml",
          "Til I See You": "Til I See You",
          "Overwhelmed": "Overwhelmed.xml"
        }))
  ];
}
