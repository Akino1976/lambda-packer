
import os

from typing import Dict, List, Any

import inflection


class MissingWordException(Exception):
    pass


def json_handler(event: Dict[str, str], context: object) -> Dict[str, str]:
    word = event.get('word')

    if not word:
        raise MissingWordException('No word in event')

    print('Here is the event:')
    print(event)

    return {
        'singular': inflection.singularize(word),
        'plural': inflection.pluralize(word)
    }
