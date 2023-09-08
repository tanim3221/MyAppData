export function properCase(str) {
    return str
      .split('_')
      .map((word) => word.charAt(0).toUpperCase() + word.slice(1))
      .join(' ');
  }

  export function camelCase(str) {
    return str
      .split('_')
      .map((word, index) => {
        if (index === 0) {
          return word.toLowerCase();
        }
        return word.charAt(0).toUpperCase() + word.slice(1).toLowerCase();
      })
      .join('');
  }

  export function snakeCase(str) {
    return str
      .split('_')
      .map((word) => word.toLowerCase())
      .join('_');
  }

  export function kebabCase(str) {
    return str
      .split('_')
      .map((word) => word.toLowerCase())
      .join('-');
  }

  export function pascalCase(str) {
    return str
      .split('_')
      .map((word) => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase())
      .join('');
  }

  export function titleCase(str) {  
    return str
      .split('_')
      .map((word) => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase())
      .join(' ');
  }

  export function sentenceCase(str) {
    return str.charAt(0).toUpperCase() + str.slice(1).toLowerCase();
  }

  export function dotCase(str) {
    return str
      .split('_')
      .map((word) => word.toLowerCase())
      .join('.');
  }
  export function pathCase(str) {
    return str
      .split('_')
      .map((word) => word.toLowerCase())
      .join('/');
  }

  export function constantCase(str) {
    return str
      .split('_')
      .map((word) => word.toUpperCase())
      .join('_');
  }
  export function swapCase(str) {
    return str
      .split('')
      .map((character) => {
        if (character === character.toUpperCase()) {
          return character.toLowerCase();
        }
        return character.toUpperCase();
      })
      .join('');
  }

  export function trim(str) {
    return str.trim();
  }

  export function trimStart(str) {
    return str.trimStart();
  }

  export function trimEnd(str) {
    return str.trimEnd();
  }

  export function trimAll(str) {
    return str.replace(/\s/g, '');
  }

  export function trimAllStart(str) {
    return str.replace(/^\s+/g, '');
  }

  export function trimAllEnd(str) {
    return str.replace(/\s+$/g, '');
  }

  export function trimAllExtra(str) {
    return str.replace(/\s+/g, ' ');
  }
  export function getProdDevUrl() {
    const domain = process.env.NODE_ENV === 'development' ? 'http://localhost:8080/project-cv' : 'https://saklayen.cf';
    return domain;
  }
