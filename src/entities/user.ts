import { randomUUID } from "crypto";
import { Replace } from "../helpers/replace";
export interface UserProps {
  id: string;
  name: string;
  email: string;
  password: string;
  telephone: string;
  profileImg: string;
  biography:  string;
  birthday: Date;
  status?: string | null;
  created_at?: Date;
  updated_at?: Date | null;
}

export class User {
  private _id: string;
  private props: UserProps;
  costructor(
    props: Replace<UserProps, { createdAt?: Date }>,
    id?: string,
  ){
    this._id = randomUUID();
    this.props = {
      ...props,
      created_at: props.created_at || new Date(),
      updated_at: props.updated_at || new Date(),
    };
  }

  public get id(): string{
    return this._id;
  }


}