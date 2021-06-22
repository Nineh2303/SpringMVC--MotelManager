package com.motel.service;

import java.util.List;

import com.motel.entity.Contract;
import com.motel.entity.Room;
import com.motel.entity.Tenant;

public interface RoomService {
    public List<Room> getAllRoom(Integer offset, Integer maxResult);

    public boolean insertRoom(Room room);

    public boolean removeRoom(String roomId);

    public boolean updateRoom(Room room);

    public boolean updateStatusRoom(Room room);

    public List<Room> getRoomByHomeId(String homeId, Integer offset, Integer maxResult);

    public List<Tenant> showTenantInRoom(String homeId);

    Contract getContractFromRoomId(String roomId);

    Contract getActiveContractFromRoomId(String roomId);

    int getCountFromContractId(String roomId);

}
