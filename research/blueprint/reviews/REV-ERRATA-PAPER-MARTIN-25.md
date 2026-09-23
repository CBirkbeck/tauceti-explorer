# Independent errata review: Martin's Markoff-graph theorem

Issue #1714; job REV-ERRATA-PAPER-MARTIN-25. Codex, session `codex-hjdg0j`, 23 September 2026. Complete. The original errata writer was Claude Code, session `cc-fb70e5`; this reviewer wrote neither that file nor the extraction.

## Versions and reading

Read the full four-page published paper and full three-page arXiv preprint, including the graph definition and the entire elementary averaging proof. Inspected published pp.623–625 and arXiv pp.1–2 as rendered page images. The theorem is numbered 1.4 in print and 1.3 in the preprint; their unqualified divisibility claims agree.

| Source | SHA-256 | Access and scope |
| --- | --- | --- |
| [Publisher PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01346-9.pdf) | `3e1f4b7f99f18b71159463aaf2d9e649e11317272782f9105299a9d72369097c` | Public cached download from 21 September, independently read 23 September 2026; current publisher PDF/HTML also read through web access |
| [arXiv v1 PDF](https://arxiv.org/pdf/2502.15960v1) | `64545305d72b6a3476c980798c8133c4b034341de6145a0782a25b8669fbec7d` | Freshly downloaded 23 September 2026 |
| [Eddy et al., author PDF](https://www.math.ucdavis.edu/~efuchs/Markoffconnectivity.pdf) | `0795f7cd9c28c147ed642392919cd0879714a36e461ca353b379f7ea66bee8c0` | Freshly downloaded; Theorem 1.4 on PDF p.3 and its image, for the numerical threshold only |

Direct HTTP requests to Springer returned a JavaScript challenge, not a PDF. The review therefore records the actual cached-PDF provenance rather than assigning the challenge's hash to the paper. The public paper itself was independently reread; no verdict relies solely on an earlier worker's quotation. Further metadata URLs, hashes and access dates are in the JSON.

## E1: confirmed in publication

The graph uses the coefficient-3 equation and all nonzero triples, without quotienting by coordinate permutations or signs. Modulo 3 the nonzero vertices are exactly {±1}³. Each Vieta move flips one coordinate, so all eight vertices lie in one component. Eight is not divisible by 3. Modulo 2 the four vertices listed in the companion report form one component, whose size is divisible by 2.

The published proof covers every prime greater than 3. Its weight assignment is defined because a nonzero solution cannot have two zero coordinates. The vertex weights sum to 1, and the weight in coordinate i plus its value at the i-th Vieta neighbour is 1. Since each involution permutes any connected component, twice the coordinate-weight sum is the component's cardinality, including fixed points. Summing over all three coordinates gives |C| = 3|C|/2 in F_p, hence p divides |C|. This checks the correction for arbitrary primes rather than extrapolating from experiments.

Retain **error / a stated result**, with the exact correction **p ≠ 3**. Excluding this one prime leaves the sufficiently-large-prime consequence unchanged. The coordinate change z=3x intertwines coefficient-3 and coefficient-1 Vieta moves precisely when 3 is invertible; at p=3 the coefficient-1 equation has no nonzero F₃-solution. The counterexample concerns Martin's stated convention, not Chen's differently normalized result.

## Additional findings already corrected in print

**E2: confirmed misprint.** ArXiv v1 p.2 omits 3 from the denominator in one prose formula immediately before (2.3). The definition and adjacent display already have the factor, and published p.625 supplies it. The explicit p=5 neighbour (2,1,1) of (1,1,1) distinguishes the correct weight 4 from the printed quotient 2. This is recorded as corrected in publication, affecting nothing in the intended proof.

**E3: confirmed preprint error.** ArXiv v1 p.1 states the tree/connectedness assertion for integer solutions without positivity. Every nonzero integer solution has nonzero coordinates, and x_i x′_i = x_j²+x_k² > 0 implies that Vieta moves preserve coordinate signs. The solutions (1,1,1) and (-1,-1,1) cannot be connected. Published p.623 restricts the assertion to positive integer solutions. The JSON records this as a preprint assertion already corrected in print, with no implication that the journal retains it.

## Computation and the numerical non-finding

A standalone scratch script enumerated all triples and computed connected components using only the three Vieta moves. It checked closure and involutivity on every vertex. Results:

| p | Vertices | Component sizes |
| --- | --- | --- |
| 2 | 4 | 4 |
| 3 | 8 | 8 |
| 5 | 40 | 40 |
| 7 | 28 | 28 |
| 13 | 208 | 208 |
| 17 | 340 | 340 |
| 31 | 868 | 868 |

For the five primes greater than 3, all 1,484 vertex-weight checks and 4,452 involution-coordinate checks passed, including zero-coordinate vertices and fixed involutions. Component-weight sums and the coefficient-normalization bijection were also checked. These finite diagnostics supplement the argument above; they do not prove the general theorem.

The exact integer product in Eddy et al., Theorem 1.4, is (863#)(53#)(13#)(7#)(5#)3³2⁵. Direct integer arithmetic gives 3.448048382677681693… × 10^392, below Martin's 3.489 × 10^392 sufficient threshold. Thus that threshold supplies no additional finding. The earlier errata report's claim about a decimal in [7]'s publisher HTML was removed from the reviewed assessment, since this review did not check that HTML.

## Existing corrections and validation

On 23 September 2026 the [publisher page](https://link.springer.com/article/10.1007/s00222-025-01346-9) retained E1 and linked no correction; the [arXiv history](https://arxiv.org/abs/2502.15960) listed only v1, dated 21 February 2025. The [author's publication list](https://dem6.people.clemson.edu/) showed no correction, and [Crossref](https://api.crossref.org/works/10.1007/s00222-025-01346-9) contained no update-to/updated-by entries and an empty relation object. Exact-title, DOI and author/Markoff searches with erratum, corrigendum and correction found none relevant to E1. “New” is limited to this search. E2–E3 instead name the published version as their correction.

Errata schema, four-file intake and whitespace checks pass. This errata review requires no Lean file; no compilation was run. Although both versions were read in full, the cited external theorems were not independently re-proved or re-audited.
