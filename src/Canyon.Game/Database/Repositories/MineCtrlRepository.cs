﻿using Canyon.Database.Entities;
using Microsoft.EntityFrameworkCore;

namespace Canyon.Game.Database.Repositories
{
    public static class MineCtrlRepository
    {
        public static async Task<IList<DbMineCtrl>> GetAsync()
        {
            await using var db = new ServerDbContext();
            return await db.MineRates.ToListAsync();
        }
    }
}
