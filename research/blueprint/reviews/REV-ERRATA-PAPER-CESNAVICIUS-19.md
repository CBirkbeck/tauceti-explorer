# Independent review: Česnavičius, purity for the Brauer group

Issue #1800; job REV-ERRATA-PAPER-CESNAVICIUS-19. Codex, session `codex-hjdg0j`, 23 September 2026. Complete. The original errata worker was Claude Code, session `cc-fb70e5`; this review checks that worker's record independently.

## Sources

All downloads below were obtained on 23 September 2026.

| Source | SHA-256 | Reading scope |
| --- | --- | --- |
| [arXiv 1711.06456v4](https://arxiv.org/pdf/1711.06456v4) | `a62a12bbe26595aec89d31d24d46774a1ee3eff73c08da0febf5a2b472118709` | §2 pp.3–6, preceding conventions, references to Proposition 2.2 throughout the text; p.4 page image |
| [Author manuscript, current site](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf) | `4187331ead5a5246acba1c032a2574ffd6ac9ee6fe1a72bb09d46e2e9f9b97a1` | Proposition 2.2 and adjoining argument p.4; byte-identical with fresh download from the old Paris-Saclay site |
| [Serre, *Galois Cohomology*, chapter I §5 excerpt](https://www.math.tau.ac.il/~borovoi/courses/Galois/Limud1.pdf) | `24fc4b546a12cfd5d63721c3d200db1a37b5638281b0a0a4d53789caeb549b5c` | Scanned page images pp.45,47–52, especially Proposition 35, Proposition 36 and its Corollaries 1–2 |

The Duke article/PDF endpoints returned HTML challenges. Springer exposed Giraud's chapter metadata but no readable chapter PDF. Neither the Duke text nor Giraud III.3.2.2 is certified here. The independent argument below and the primary Serre source establish the mathematical distinction without pretending those two sources were read. This is a review of the inherited finding and its immediate uses, not a full-paper census.

## Verdict on E1

**Confirmed: gap / affects the proof**, scoped to the accessible manuscripts. The printed lifting argument yields the neutral fibre of the H¹ map. A full fibre over a torsor P requires twisting the groups by conjugation and the quotient by the induced action. Triviality of R-torsors and Γ(V,O)=R apply to the untwisted affine R-quotient; the proof does not construct extensions of its V-defined twists. This leaves the nontrivial fibres untreated.

The torsor description follows independently: a G-reduction of an H-torsor is a section of its associated H/G-bundle, and its isomorphism class is taken modulo automorphisms of the H-torsor. Twist by an existing reduction P, identifying that reduction with the distinguished coset. The fibre through P is thus (^P H)(V)\(^P X)(V). Serre §5.3 Proposition 35 makes the change of basepoint explicit; §5.4 Proposition 36 and its Corollaries 1–2 identify the neutral and arbitrary fibres. The inherited reference to §5.5 Corollary 2 was to the wrong fibre formula and has been corrected in the JSON and report. It is not an additional source finding.

A finite-group diagnostic independently checked the distinction. For trivial C₂-action, H¹(C₂,A) is the set of A-conjugacy classes of elements a with a²=1. Enumerating D₈=⟨(1234),(24)⟩ and S₄ gives respectively four and three classes. The singleton neutral fibre survives inclusion, while the central double transposition (13)(24) and the reflection (14)(23) merge in S₄. Enumeration checks the orders, involution conditions, conjugacy orbits and neutral fibre. This disproves the abstract inference only; it is not a geometric counterexample to Proposition 2.2.

When G is commutative, H is also commutative, the H¹ map is a group homomorphism, and the proof establishes injectivity. This verifies the proposed restriction. A second valid repair is to keep arbitrary G but conclude only triviality of the neutral fibre; added this alternative to the record. The full noncommutative statement may still be true, but the missing twisted lifting argument is not supplied here.

## Downstream reach and correction search

Read the two applications on manuscript p.5. In Proposition 2.3 the group is the commutative quotient Res(T)/T. In Corollary 2.4 it is the torus T. Both therefore retain their needed full injectivity. Section 2's subsequent Brauer applications do not require the noncommutative strengthening. No other mathematical error was found in the passages reviewed, and no new finding is added.

The [old homepage](https://www.imo.universite-paris-saclay.fr/~kestutis.cesnavicius/) directs readers to the [current Sorbonne page](https://webusers.imj-prg.fr/~kestutis.cesnavicius/). The current list links this manuscript and its DOI, without a correction. Both manuscript downloads retain the passage. [ArXiv history](https://arxiv.org/abs/1711.06456) ends at v4 on 1 December 2018; v1–v3 PDFs were not read for this review. [Crossref](https://api.crossref.org/works/10.1215/00127094-2018-0057) has empty relation and no update-to entry. Exact-title searches with erratum and correction located none. All checks are dated 23 September 2026; “new” is bounded by them, especially the unavailable publisher text.

## Validation

Errata schema, four-file intake and whitespace checks pass. The small finite-group diagnostic passes and stays in scratch with PDFs, images and provenance. No Lean deliverable is required, no Lean compilation was run, and no formalization claim is made.
