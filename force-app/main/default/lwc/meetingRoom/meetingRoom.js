import { LightningElement,api } from 'lwc';

export default class MeetingRoom extends LightningElement {

    @api meetingRoomInfo={roomName : 'A-01',roomCapacity : '12'};
  @api showRoomInfo = false;
  clickedTile()
  {
   // const tileClicked = new CustomEvent('tileclick',{detail : this.meetingRoomInfo});
   const tileClicked = new CustomEvent('tileclick',{detail : this.meetingRoomInfo,bubbles:true});
    this.dispatchEvent(tileClicked);
  }
}