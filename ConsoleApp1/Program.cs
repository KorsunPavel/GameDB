using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    //enum Stratagy
    //{
    //    RTS,
    //    TBS
    //}
    //enum RPG { }
    //enum Sports { }
    //enum Adventure { }
    //enum PuzzleAndSkill { }

    //enum Race
    //{
    //    rally,
    //    arcade,
    //    formula,
    //    off_road
    //}
    //enum Action
    //{
    //    FPS,
    //    TPS,
    //}
    //class Genre
    //{
    //    public Enum Stratagy;
    //}
    class Program
    {


        static void Main(string[] args)
        {
            DbContext db = new DbContext("GameDbConnectionString");
            DbSet<>

            PlatformType mobilePlatformType = new PlatformType()
            {
                Type = "Mobile"
            };

            GenreTbl genreAction = new GenreTbl()
            {
                Name = "Action"
            };
            GenreTbl genreFPS = new GenreTbl()
            {
                Name = "FPS",
                GenreTbl2 = genreAction
            };

            GameTbl gameTable = new GameTbl()
            {
                Key = "WarCraftVersion3",
                Name = "WarCraft",
            };
            gameTable.PlatformTypes.Add(mobilePlatformType);

            CommentTbl commmentBob = new CommentTbl()
            {
                Name = "Bob",
                Body = "text of Bob body",
            };
            CommentTbl answerJimToBob = new CommentTbl()
            {
                Name = "Jim",
                Body = "My answer to Bob",
            };
        }
    }
}
