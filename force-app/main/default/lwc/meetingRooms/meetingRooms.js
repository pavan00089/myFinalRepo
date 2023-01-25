import { LightningElement,track } from 'lwc';

export default class MeetingRooms extends LightningElement {

    meetingRoomsInfo = [
            {roomName : 'A-01',roomCapacity : '12'},
            {roomName : 'A-02',roomCapacity : '2'},
            {roomName : 'A-03',roomCapacity : '6'},
            {roomName : 'A-04',roomCapacity : '8'},
            {roomName : 'A-05',roomCapacity : '50'},
            {roomName : 'A-06',roomCapacity : '100'}

    ];
    @track SelectedMeetingRoomName;
    tileClickSelectHandler(event)
    {
        const meetingRoomInfo = event.detail;
        this.SelectedMeetingRoomName = meetingRoomInfo.roomName;
    }
    // To handle the event thorugh programatically using event listner
    constructor()
    {
        super();
        this.template.addEventListener('tileclick',this.tileClickSelectHandler.bind(this));
    }
}