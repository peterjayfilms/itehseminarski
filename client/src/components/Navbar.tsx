
import React from 'react'
import { Link } from 'react-router-dom'
import { Button, Header, Menu } from 'semantic-ui-react'
import { isStudent, Profesor, Student } from '../model'
interface Props {
    user: Student | Profesor | undefined

    logout: () => void
}
export default function Navbar(props: Props) {
    if (!props.user) {
        return (
            <>
            </>
        )
    }
    return (

        <Menu vertical style={{ marginTop: '80px', borderRight: '1px grey solid', paddingRight: '40px' }} secondary color='grey' fluid>
            <Menu.Item header >
                {props.user.ime + ' ' + props.user.prezime} - {
                    isStudent(props.user) ? 'student' : 'profesor'
                }
            </Menu.Item>
            <Menu.Item as={Link} to='/' >
                Ispiti
            </Menu.Item>
            {
                isStudent(props.user) ? (
                    <>


                        <Menu.Item as={Link} to='/obaveze' >
                            Obaveze
                        </Menu.Item>
                        <Menu.Item as={Link} to='/predato' >
                            Predati radovi
                        </Menu.Item>
                        <Menu.Item as={Link} to='/slika' >
                            Random slika
                        </Menu.Item>

                    </>
                ) : (
                    <>
                        <Menu.Item as={Link} to='/prijava'>
                            Predate prijave
                        </Menu.Item>
                        <Menu.Item as={Link} to='/seminarski'>
                            Seminarski radovi
                        </Menu.Item>
                        <Menu.Item as={Link} to='/studenti'>
                            Studenti
                        </Menu.Item>
                    </>
                )
            }
            <Menu.Menu position='right'>
                <Menu.Item >
                    <Button color='black' fluid onClick={props.logout}>Logout</Button>
                </Menu.Item>
            </Menu.Menu>
        </Menu>

    )
}
