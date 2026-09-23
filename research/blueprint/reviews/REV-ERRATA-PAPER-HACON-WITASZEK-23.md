# Independent review of the Hacon–Witaszek errata

Job `REV-ERRATA-PAPER-HACON-WITASZEK-23` · Refs #1861.
Reviewer: Codex, session `codex-7e92bd`, 23 September 2026.
The errata submitted in PR #2235 were written by Claude Code, `cc-7b31c4`; earlier extraction workers
included `codex-c83e7a`. This session wrote neither the extraction nor the errata being reviewed.
The bot confirmed this session’s claim in comment 5796710207.

**Verdict: complete after corrections. All eleven findings confirmed; none rejected or added.**
The revised [errata explanation](../errata/PAPER-HACON-WITASZEK-23.md) gives the arguments. Each JSON
entry now has an individual `review` verdict, reason and this job ID.

## Independent source checks

Read the [published paper](https://doi.org/10.1017/fmp.2023.6) at every locator, using preserved public
Cambridge PDF bytes, 35 pages, SHA-256
`d7ba34ecde6764ca39071e14e79854e3c8e8db0750343c0dcc1729b84eda328b`.
Rendered and inspected pp.5, 12, 13, 17, 20, 29 and 33. Surrounding material consulted includes the
conventions on p.4, Lemma 2.7 on p.7, pp.11–13, 17, 19–21, 25–29 and 31–33. This is targeted independent
errata verification, not a fresh full-paper proof audit. In particular, the generic classification
inputs to the corrected surface lemma remain identified inputs.

Freshly downloaded [arXiv v2](https://arxiv.org/pdf/2009.02631v2), SHA-256
`161c63089dadc8f9aecd3da1753563fe8f7f9fc2b2722952307cd19bacda7c66`, and compared pp.6, 13–15, 19, 31 and 35.
E1–E9 occur in both versions. The crystalline point-count argument of E10–E11 occurs only in the published
paper. The original errata worker could not re-read the published PDF; that limitation is resolved here.

Additional primary passages personally checked:

| Source | Passage | Use |
|---|---|---|
| [Alexeev–Hacon–Kawamata v2](https://arxiv.org/pdf/math/0605137v2) | pp.3–6, especially Definitions 2.2–2.3 | Discrepancy sign, first sum, weight domains |
| [de Fernex–Hacon v3](https://arxiv.org/pdf/0901.0389v3) | pp.4–6, especially Proposition 3.1 | The explicit neighbourhood conclusion |
| [Kollár’s public surface notes](https://web.math.princeton.edu/~kollar/book/chap2.pdf) | §§75–76, 85–87, pp.35, 41–42 and surrounding graph discussion | Determinant and log-adjunction index |
| [Esnault’s published paper](https://page.mi.fu-berlin.de/esnault/preprints/helene/62-chowgroup.pdf) | p.188, Theorem 1.1 and trace formula | Restriction to positive degrees |

Their PDF SHA-256 hashes, respectively, are
`1d1e5642fdb7b2a2c04ccf9800de13c7b3649eed344034538142116f09c7cf28`,
`28e597c5113ffec80d773ebfe60538b3be38b33141b0ef9df7a474e6d5bd3c34`,
`1219c79982d0a5d38d7a81fbfc81933e1880bd5014ae329adaa648d5e8ed13e8`, and
`635b51293a25d937bb37f1747dfe74a5eb8e5aa3c24d530b3b28a85ef3ee0014`.
The de Fernex–Hacon PDF was also preserved from a public download by another worker and read independently.

The [arXiv history](https://arxiv.org/abs/2009.02631), fresh
[Crossref metadata](https://api.crossref.org/works/10.1017/fmp.2023.6), Cambridge search record,
[Witaszek’s publication list](https://sites.math.northwestern.edu/lro1793/publications.html) and bounded
title/DOI correction searches yielded no existing correction on 23 September 2026. A fresh Cambridge HTML
read failed. The new search records explicitly limit `known: new` to these checks.

## Individual verdicts

| Finding | Verdict | Independent check and changes |
|---|---|---|
| E1 | Confirmed error | The crepant A₁ calculation gives canonical index 1, ruling index 2 and different 1/2. Rephrased correction around the log index and determinant calculation. |
| E2 | Confirmed error | The family bC has varying exceptional discrepancy −b/2 with uniform ε=1/2. Explicitly scoped the repair to minimal-resolution exceptional values and fixed finite coefficients; added m=2 for the convention counting strict transforms. |
| E3 | Confirmed misprint | Dividing the displayed inequality by positive a_i r_i removes the spurious minus sign. |
| E4 | Confirmed misprint | AHK’s a(B_i)≤0 means b_i≥0; the printed first sum is identically zero. |
| E5 | Confirmed misprint | W(0) already evaluates w(1). Distinguished the required extended domain from AHK’s actual declared domain. |
| E6 | Confirmed error | Checked every hypothesis of the punctured-node family and the degree −1 small-resolution obstruction. Supplied the proper closed-image argument without claiming to reprove the mixed-characteristic local theorem. |
| E7 | Confirmed proof gap | N¹ surjectivity only gives rational numerical classes. Checked the effective-boundary construction and made its limited scope explicit: the perturbed lifted-step argument remains separate. |
| E8 | Confirmed misprint | Negative self-intersection and the equality case of adjunction require c_2=2. |
| E9 | Confirmed misprint | Smallness supplies exactly the codimension-one hypothesis of Lemma 2.7. Corrected the preprint theorem number. |
| E10 | Confirmed misprint | The published trace formula counts the resolution Y, so it must use Y’s cohomology. |
| E11 | Confirmed misprint | Degree zero contributes 1; Esnault’s theorem explicitly treats i>0. |

The counts remain seven misprints, three errors reaching auxiliary stated results and one gap reaching a
proof. No main theorem is disproved. The E7 construction is not promoted into a complete proof of (2b).
The extraction, its handoff and the generated register remain unchanged.

## Validation

`python3 scripts/check_errata.py research/blueprint/errata/PAPER-HACON-WITASZEK-23.json`, intake
`check-files` for the three authorized deliverables, and `git diff --check` pass.
Scratch symbolic/rational diagnostics verified two A₁ chart identities, the ruling pullback coefficient,
200 distinct half-lc boundary examples, two node-resolution charts and their transition, the corrected
weight’s nonzero boundary contribution, and four degree-zero point-count examples. They do not replace
the cited general geometric inputs. All eleven original IDs are preserved and carry this review’s verdict.

No Lean artifact was required or compiled. No formalization claim is made.
