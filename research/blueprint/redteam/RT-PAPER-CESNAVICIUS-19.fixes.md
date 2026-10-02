# FIX-RT-PAPER-CESNAVICIUS-19

Codex, session `codex-rtOQ9t`, 2 October 2026. Refs [#5514](https://github.com/CBirkbeck/tauceti-explorer/issues/5514).
Base: `276688ece4638c91fbc8193547d8594d182e09cb`.

All four findings confirmed by `RT-PAPER-CESNAVICIUS-19.review.json` are addressed, including /4, which the issue's quoted list omits. This is a repair of extraction records, not an independent review or a new formalization. The five authorized deliverables contain all changes.

## /1: shared ownership with the completed CS24 extraction

The two extractions now name the same three proposed owners, with identical route type, ID, title, area and parent where applicable:

| Shared owner | 2019 contribution |
| --- | --- |
| `PurityForFlatCohomology` | Punctured/Hartogs/regular-local Picard inputs; local and global purity; purity-specific support vanishing and coniveau application; intersections, residues, and local parafactorial/Lefschetz/Picard applications |
| `SchemeAndStackFoundationsFlatCohomologyPartII` | `cohom-brauer` and `affine-brauer-comparison` |
| `PerfectoidQuotientsIntegralPerfectoidPartII` | All six residue/perfectoid-tower obligations |

CS24's prerequisite no longer says that the 2019 paper is unextracted. Its first three routes identify the shared 2019 inputs. Items /037, /118–119, /132–134, /137–138 and /140–141 have explicit cross-references and scope qualifications. No CS24 item statement, status or route membership changes. In particular /133's global projective statement, /134's dimension-three torsion conclusion and /140's two extension clauses remain distinct from their 2019 local inputs.

The 2019 Theorem 6.1 retains **H⁰–H² bijectivity and H³ injectivity**, for the stated regular local rings and quasi-compact complement inclusion. CS24 7.2.8(a)'s H² injectivity cannot supply the stronger output. The local vanishing in 2019 Theorem 5.3, Theorem 6.2's injectivity assumption on every nonempty open, and the imperfect-residue primary exclusions are unchanged. Azumaya `Br`, torsion cohomological `Br′`, and ambient H² remain distinct until the cited comparison with its hypotheses.

`supports`, `support-local-global` and `strict-support-stalk` remain at SF.2, together with sites, coefficient/descent/completion and perfectoid-cohomology preparation and Appendix A field cohomology. Only purity vanishing and its coniveau/globalization application move. SGA 2 VIII finiteness/depth and IX formal comparison/algebraization remain at SF.4 with Elkik approximation. The shared tower proposal explicitly imports **P7's generic Frobenius/limit/completion/inversion infrastructure**. The purity consumer imports Gabber absolute purity through the existing proposed `EtaleDualityAbsolutePurityPartII` (CS24/041–042); its adapter remains missing. No new general Gabber, support, formal-algebraization or tower carrier is proposed.

## /2: one canonical E1, with both review histories

The extraction's `sourceIssues` contains the sole active `PAPER-CESNAVICIUS-19/E1`. Its `kind=gap` and `affects=a stated result` concern the general noncommutative statement being unestablished by its printed proof; they do not assert that the geometric proposition is false. The merged correction includes:

1. Full injectivity for commutative G, covering Proposition 2.3 and Corollary 2.4.
2. Singleton neutral fibre for arbitrary affine smooth G.
3. The missing surjectivity of every twisted-fibre map if the full noncommutative statement is retained.

The dedicated errata file has an empty collected `sourceIssues` array and an external canonical cross-reference. Both former records, full independent review reasons, and the earlier `affects=the proof` classification are preserved in history. The canonical current review is unchanged. The Serre locator is corrected to I.§5.4 Corollary 2 using the **prior errata review's** source check; Serre and Giraud were not newly audited here. E2–E4 lose only the obsolete awaiting-review text. Their existing review verdicts and unread published-source qualifications remain, as do E5 and all other mathematics/search records.

The actual `scripts/errata.py` collector now returns one confirmed E1, from the extraction, reviewed by `REV-PAPER-CESNAVICIUS-19`. No collector or generated register is edited.

## /3: reading provenance and the published-text worklist

`sourceVersions` declares only the two actual readings, with their historical **23 September 2026** dates and bounded fresh-check scope:

| Version | SHA-256 | Fresh bounded reading |
| --- | --- | --- |
| [arXiv 1711.06456v4](https://arxiv.org/pdf/1711.06456v4) | `a62a12bbe26595aec89d31d24d46774a1ee3eff73c08da0febf5a2b472118709` | pp.1–2,4,11–14; page images 4,11,13 |
| [Author manuscript](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf) | `4187331ead5a5246acba1c032a2574ffd6ac9ee6fe1a72bb09d46e2e9f9b97a1` | Proposition 2.2, p.4 |

Fresh downloads reproduce both hashes. The historical full reading and manuscript collation are attributed to the prior extraction/review, not claimed anew. The author's manuscript predates v4; it is not the Duke version of record. Duke non-reading stays in `source.readSections` and the finding's locator/search scope, **outside `sourceVersions`**.

The bounded fresh correction search checked the [current author's publication list](https://webusers.imj-prg.fr/~kestutis.cesnavicius/), exact-title correction/erratum searches, and the [Crossref DOI record](https://api.crossref.org/works/10.1215/00127094-2018-0057). No applicable correction was found in that search; Crossref's relation was empty. The Project Euclid PDF endpoint returned a 1,159-byte HTML challenge, not a readable PDF. The Duke text is neither read nor collated. E2–E5's supporting-source correction searches were not repeated.

Before repair, read-only `collation.records/provenance/stated/exposure` gave this paper six active findings, one stated finding, `published`, and no exposure row. After repair it gives five findings, one stated finding, **`preprint`**, and an exposure row for Proposition 2.2. No `--write` invocation or generated-data edit was made.

## /4: retired SF.0 obligations and missing smooth lifting

The empty SF.0 route is removed. `punctured`, `hartogs` and `pic-regular` share the purity owner. `det-free-resolution` is attached to the R03.3 regular-local factoriality proof with its **full ringed-space, finite locally free sheaf statement and locally constant ranks** unchanged. A concrete SF.1 request supplies determinant/top-exterior-power and determinant isomorphisms for short exact sequences and finite acyclic complexes. This is the sheaf interface needed for SGA 2 XI 3.15, not an unannounced module-only replacement.

`henselian-smooth-lift-import` changes from planned to **missing**, and is routed exactly once to SF.4 alongside its Elkik consumers, explicitly coalescing the missing `PAPER-CLAUSEN-MATHEW-MORROW-21/044`. The Mathlib pin's actual `HenselianRing R I` states monic simple-root lifting and the Jacobson condition; it does not prove equivalence with this smooth-algebra lifting theorem. That carrier is reused unchanged, and G-ELKIK remains open.

## Maintainer follow-up outside the five deliverables

These are concrete integration requests, not additional findings or completed changes.

| Consumer record | Required import adjustment |
| --- | --- |
| `PAPER-HARPAZ-WITTENBERG-20/16` | Replace the SF.2 purity/residue theorem owner with `PurityForFlatCohomology` imports `global-gm-purity`, `brauer-intersection`, `global-residue-exact` and `residue-primary-boundary`; keep `generic-inject` and general sites/cohomology at SF.2. Its characteristic-zero scheme assumptions make the residue exclusions harmless, but the birational conclusion still needs its properness/birational argument. |
| `PAPER-BRIGHT-NEWTON-23/48` | Import the common `brauer-intersection`/`codim1-intersection` theorem from `PurityForFlatCohomology`, plus general restriction/cohomology and affine Brauer comparison from their suppliers. Retain the exact smooth O_k model, common function field and geometrically irreducible special-fibre assumptions; establish the stated two-factor intersection from the general theorem. |
| `PAPER-BENOIST-19/10` | Import `dvr-residue-exact`, `global-residue-exact`, `residue-primary-boundary` and `brauer-intersection` from the shared purity owner. Keep its finite-extension residue compatibility and ramification-index formula as a separate adapter with orders invertible in the residue field. |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/044` | Align its missing smooth-lifting obligation with the SF.4 shared request here; no planned-status promotion until the exact supplier theorem is planned or built. |

For `scripts/collation.py`, require **positive reading evidence for the relevant paper/version**: a declared `published` entry that explicitly says unread must not establish publication provenance; respect negative collation evidence, and exclude publisher URLs belonging to supporting sources. A hash neither proves reading nor is mandatory for a browser reading. Add meaningful regression cases for supporting-source publisher links plus an author-copy hash, negative reading text, an explicitly unread published declaration, and an actual positive published reading without a hash. Regenerate the worklist/register only after that tool repair.

Re-audit the hidden `BHARGAVA-25`, `FARGUES-SCHOLZE-21`, `KEDLAYA-LIU-15` and `STEVENS-08` records (36 stated findings named by the verifier), and the unread-published-entry recommendations in `RT-PAPER-HE-LI-SHI-ETAL-23/1`, `RT-PAPER-KOYMANS-MILOVIC-21/2` and `RT-PAPER-LIU-WOOD-ZUREICKBROWN-24/4`. Publication existence belongs in metadata/non-reading notes until that version is actually read. These other files and tool edits are outside this job.

## Validation and limits

- Both paper validators, the errata validator and the five-file intake check pass.
- Supplemental checks preserve every item ID/statement, dependency, definition API, planning test and library citation; only the named smooth-lifting status changes. All 151 missing items have exactly one route; the unchanged item dependency graph remains acyclic. All three shared route identities match CS24, with valid cross-references and preserved supplier boundaries.
- Read-only collation and errata collection confirm one canonical reviewed E1 and restored exposure. Both historical independent E1 reviews and E2–E5 reviews are preserved.
- Final counts: **178 items = 15 library + 12 planned + 151 missing; 18 routes; 42 definitions/constructions; 126 planning tests; 25 inherited gap IDs**. The historical reader counts are explicitly superseded by the current repair section.

Pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No library build, cache operation or Lean compilation was performed or required. Fresh source reading was bounded as listed (also CS24 v3 pp.29,88–91, hash `2f9d3ee868c244a7ddd6579a5dafed10a7ac9eb8b2ffe840db9f2bc115cd6ed4`); no fresh full transitive supplier audit, mathematical certification of pending obligations, or new independent review is claimed.
