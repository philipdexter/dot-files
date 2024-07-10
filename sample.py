import json
import subprocess

def gh():
    return json.loads(subprocess.check_output(['gh', 'api', '--method', 'GET', 'notifications']).decode('utf-8'))

def mark_done(thread_id):
    return subprocess.check_output(['gh', 'api', '--method', 'DELETE', f'notifications/threads/{thread_id}']).decode('utf-8')

def fetch_diff(repo, pr):
    return subprocess.check_output(['gh', 'pr', 'diff', '--repo', repo, pr]).decode('utf-8')

import vim
def populate_notifications():
    vim.command('normal ggdG')
    for notification in gh():
        thread_id_location = notification['url'].rfind('/')
        thread_id = notification['url'][thread_id_location+1:]
        link = notification['subject']['url'].replace('api.', '').replace('/repos', '').replace('pulls', 'pull')
        repo = notification['repository']['full_name']
        title = notification['subject']['title']
        reason = notification['reason']
        pr_num_location = notification['subject']['url'].rfind('/')
        pr_num = notification['subject']['url'][pr_num_location+1:]
        new_line = f'{thread_id} {pr_num} {repo} {reason} {title} {link}'
        vim.current.buffer.append(new_line)
    del vim.current.buffer[0]

def v_mark_done():
    row, col = vim.current.window.cursor
    current_line = vim.current.buffer[row-1]
    thread_id = current_line.split()[0]
    # del vim.current.buffer[row-1]
    mark_done(thread_id)

def v_fetch_diff():
    row, col = vim.current.window.cursor
    current_line = vim.current.buffer[row-1]
    repo = current_line.split()[2]
    pr = current_line.split()[1]
    diff = fetch_diff(repo, pr)
    vim.command('new')
    vim.command('set syntax=diff')
    for line in diff.split('\n'):
        vim.current.buffer.append(line)
    del vim.current.buffer[0]


# TODO add unsubscribe
