# Verification of RT-PAPER-CESNAVICIUS-19

Issue #4193, job `REV-RT-PAPER-CESNAVICIUS-19`. Codex, session
`codex-J6LwjP`, 30 September 2026. **All four findings are confirmed**, with
the repair qualifications below. This is a verification of the reported
ownership and recordkeeping defects, not a fresh acceptance of either paper
extraction or a new erratum against the published Duke article.

## Scope and independence

The red team was Claude Code `cc-c2c06b`. The extraction was completed by
`cc-442dc5`, continuing `cc-fb70e5` and `cc-7b31c4`; its reviewer was
`cc-d67081`. I did none of these jobs. The separate errata review was by Codex
`codex-hjdg0j`, also a different session.

I checked repository revision `2c51791`, read the complete red-team result and
report, the named extraction items/routes and the first three CS24 design
briefs, both E1 records, the relevant prior review entries, the named companion
extraction items, and `scripts/collation.py`. I inspected RS-25's retained
scope, the relevant RS-05/RS-08 boundaries, and assembled the atlas in memory
(2,907 stages, 8,322 stage edges). SF.0's narrowing is in its `restructured`
metadata; its historical description still appears alongside it.

No assertion below certifies the remaining 178-item extraction, all 34 of the
red-teamer's library references, E2–E5's mathematical proofs, or the complete
Česnavičius–Scholze extraction. Cross-references to other papers were checked
as routing evidence, not independently accepted anew.

## Public sources read

All five PDFs were freshly downloaded and hashed on 30 September 2026. Their
hashes agree with the extraction records. Page numbers below are PDF pages.

| Source | SHA-256 | Reading for this verification |
| --- | --- | --- |
| [Česnavičius, arXiv 1711.06456v4](https://arxiv.org/pdf/1711.06456v4), 17 pages | `a62a12bbe26595aec89d31d24d46774a1ee3eff73c08da0febf5a2b472118709` | pp.1–2, 4–6, 11–13: main purity statements, Proposition 2.2 and its two commutative applications, Brauer comparison, towers and globalization; p.4 also viewed as an image |
| [Author's Brauer-purity manuscript](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf), 17 pages, dated 27 November 2018 | `4187331ead5a5246acba1c032a2574ffd6ac9ee6fe1a72bb09d46e2e9f9b97a1` | Proposition 2.2 and adjacent argument, p.4; not a new whole-document collation |
| [Česnavičius–Scholze, arXiv 1912.10932v3](https://arxiv.org/pdf/1912.10932v3), 97 pages | `2f9d3ee868c244a7ddd6579a5dafed10a7ac9eb8b2ffe840db9f2bc115cd6ed4` | Lemma 3.1.1, p.29; Theorem 7.2.1, p.88; Theorem 7.2.5, Lemma 7.2.7 and Theorem 7.2.8, pp.90–92 |
| [SGA 2, recomposed annotated edition](https://www.cmls.polytechnique.fr/~laszlo/sga2/sga2-smf.pdf), 216 pages | `1c648d9588367c7ebcaa1b9c7d043642b8ee470e8d4f5e23579448ec3d858da1` | XI 2.1–2.2, 3.1–3.7, 3.13 and 3.15 with surrounding arguments, pp.108–110, 113–114 |
| [Elkik, original journal scan](https://www.numdam.org/item/10.24033/asens.1258.pdf), 52 pages | `74ddbf6a04ca9fb4e6b9ef0da537231045a293d56242571749cda079349d40c5` | §0.1 and beginning of §0.2, PDF pp.3–4 / printed pp.554–555, for the henselian-pair interface and Noetherian convention |

The Duke version of record, the published Annals article, the original 1968
SGA 2 edition and Giraud were not read here. The 2019 extraction itself says
the Duke text was not collated; finding /3 concerns that recorded fact, not a
new assertion about current publisher access.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, I read the actual
statements of `IsAzumaya` (`Mathlib/Algebra/Azumaya/Defs.lean:60`),
`BrauerGroup` (`Mathlib/Algebra/BrauerGroup/Defs.lean:99`), `CommRing.Pic`
(`Mathlib/RingTheory/PicardGroup.lean:429`), `HenselianRing`
(`Mathlib/RingTheory/Henselian.lean:94`) and `IsAdicComplete.henselianRing`
(same file, line 170). They provide Azumaya algebras over rings, a field Brauer
group, the ring Picard group, and monic simple-root lifting along an ideal.
They do not by their statements supply the scheme-purity results or the
smooth-algebra lifting interface in dispute. Targeted searches of both pinned
RingTheory trees (Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`) found no
named henselian/smooth lifting match. This is a limited search, not a fresh
whole-library absence audit; no Tau Ceti theorem is invoked as a new supplier.

## /1 — high, confirmed: the purity programme has incompatible routes

The item-level comparison establishes the overlap independently of word
searches in stage titles:

| 2019 item(s) | Current destination | CS24 item(s) and common content |
| --- | --- | --- |
| `local-pic-lefschetz` | SF.4 | /133, SGA 2 XI 3.13(ii), the local complete-intersection Picard vanishing theorem |
| `parafactorial` | SF.4 | /132, the parafactorial condition on restriction of line bundles |
| `pic-regular` | SF.0 | /134's regular local case |
| `hartogs` | SF.0 | /140's Noetherian depth-two function case |
| `purity-dim2` | SF.2 | /137's dimension-two Brauer comparison, specialized to the strictly henselian case |
| `strict-local-purity`, `global-gm-purity` | SF.2 | /138's regular case and its globalization inputs |
| `global-purity-h0`–`global-purity-h2` | SF.2 | /141, overlapping low-degree purity for multiplicative-type groups, with different strengths in degree two |
| `cohom-brauer`, `affine-brauer-comparison` | SF.2 | /118–119, the scheme Brauer constructions and Gabber comparison in the proposed SF Part II |
| `residue-tower-exists`, `perfectoid-tower-exists` and their construction inputs | P7 | /037, Lemma 3.1.1 explicitly resting on the 2019 Lemmas 5.1–5.2, in the proposed PerfectoidQuotients Part II |

The relevant CS24 items are assigned to its first three routes. Its purity
brief explicitly includes this earlier paper; the queue still has
`DESIGN-PurityForFlatCohomology` pending. SF.0/SF.2/SF.4 have foundation,
cohomology and algebraization scopes, but none explicitly owns this purity
programme. A source route to them and an unrelated new-roadmap brief do not
establish the required unique theorem owner. The three wider references in
HARPAZ-WITTENBERG-20/16, BRIGHT-NEWTON-23/48 and BENOIST-19/10 still route their
purity/residue material to SF.2 at the checked revision.

**Repair:** coalesce the purity programme under the existing proposed ID
`PurityForFlatCohomology`, the scheme Brauer foundations under
`SchemeAndStackFoundationsFlatCohomologyPartII`, and the specific regular-local
tower constructions under `PerfectoidQuotientsIntegralPerfectoidPartII`.
Reuse the existing titles, briefs and future design jobs. Update the stale CS24
prerequisite and name shared supplier items. Preserve P7's general Frobenius
criterion and limit machinery as imports; moving the specific Cohen towers is
not a transfer of all P7 ownership. The other three purity consumers need an
explicit supplier handoff, within the subsequent fix's authorized files.

The proposed repair needs three mathematical qualifications:

- This is shared ownership, not literal identification of every pair in the
  table. CS24 7.2.8(a) gives H² injectivity, whereas the 2019 Theorem 6.1 gives
  full H² bijectivity and H³ injectivity for tori under its regularity and
  quasi-compactness hypotheses. Retain those stronger assertions and their
  globalization proof. Do not replace full cohomology by torsion subgroups.
- Keep Azumaya Br, cohomological Br′ and ambient H² separate until the relevant
  Gabber/regularity comparisons apply. CS24 /118 and the 2019 `cohom-brauer`
  define related, not definitionally identical, objects.
- Do not move the generic `supports` construction or `support-local-global`
  spectral sequence away from SF.2 merely because purity uses them. SF.2
  already owns cohomology/localization. The new purity roadmap should import
  those foundations and own its specific vanishing, coniveau application and
  globalization arguments. Apply the same supplier/consumer distinction to
  general formal-algebraization inputs in SF.4.

## /2 — medium, confirmed: E1 is duplicated with conflicting classifications

The extraction records E1 as a gap affecting a stated result, preserving the
former proof classification. The dedicated errata file records the same ID as
a gap affecting the proof. Their two corrections differ: only the errata
record explicitly retains arbitrary smooth affine G with the weaker conclusion
that the neutral fibre is trivial. The extraction's claim that E1 was copied
unchanged is therefore stale. The current generated `data/source-issues.json`
contains both rows, one with each classification.

Proposition 2.2 in both accessible manuscripts asserts full injectivity. Its
displayed argument treats the neutral fibre of a map of pointed H¹ sets;
full injectivity for noncommutative G requires control of other fibres. Its
two displayed uses in Proposition 2.3 and Corollary 2.4 have commutative groups.
Thus preserving `kind: gap`, scoped to these manuscripts, with
`affects: a stated result` is a reasonable canonical classification. This does
not assert a counterexample to the geometric proposition or a defect in its
commutative purity applications. I did not freshly certify the inaccessible
Giraud passage or the separate errata review's group-cohomology diagnostic.

**Repair:** keep one active E1 record, preferably the extraction's, combine the
valid repair alternatives and retain both independent reviews' provenance and
the classification history. Replace the other occurrence with an ordinary
cross-reference outside the collected `sourceIssues` list. Merely assigning
the duplicate a new finding ID would still leave two active findings and is
not sufficient. Correct `sourceIssuesRegister`; if the canonical record is
instead in the errata file, add the actual source versions there. Let normal
intake regenerate the published register.

E2–E4 have confirmed review objects but stale text saying review is pending.
Remove that stale status. Preserve their explicit qualifications about the
unread published Gabber–Ramero book and original SGA 2 edition; replacing all
of that text by an unqualified `new` would lose useful provenance. This
verification does not perform a new search for corrections to those sources.

## /3 — medium, confirmed: provenance inference hides the paper

I ran the current `provenance`, `stated`, `records` and `exposure` functions
without writing their generated output. The 2019 result has no top-level
`sourceVersions`; `provenance` reports `published`, `stated` returns E1, and
the paper is absent from the exposure list. The first publisher match is the
Springer Gabber–Ramero metadata URL in E2/E3. The first reading-word match in
the concatenated notes is `SHA-256` from the author manuscript. The expression
also accepts the negative phrase about inability to collate. The two matches
need not even refer to the same source.

The second defect also reproduces:

| Paper | Explicit record says | Stated findings | Current classification / exposed |
| --- | --- | ---: | --- |
| BHARGAVA-25 | metadata read, PDF not read | 7 | published / no |
| FARGUES-SCHOLZE-21 | SMF text not read | 4 | published / no |
| KEDLAYA-LIU-15 | SMF text not obtained | 21 | published / no |
| STEVENS-08 | Springer text not read | 4 | published / no |

These are the reported 36 findings; their mathematics was not re-reviewed.
The three other red-team repair instructions named in /3 do recommend unread
published entries, so the warning about applying those instructions is valid.

**Repair:** add the two actually read versions, with their recorded dates,
URLs and the matching hashes above; retain the Duke non-reading note separately.
In an in-memory copy, making just that addition changes provenance to
`preprint` and exposes this paper with one stated-result finding. Do not call
the earlier 23 September reading a new reading performed by this verifier.

The maintainer's tool repair must associate positive text-reading evidence with
the relevant paper and version, exclude explicit non-reading, and ignore
supporting-source publisher links. Requiring a hash alone is neither necessary
for a browser reading nor sufficient to prove the text was read. Until the
schema/tool supports explicit unread entries safely, list only actual readings
in `sourceVersions`. The script and the other papers are outside this
verification's two deliverables.

## /4 — low, confirmed: SF.0 is not the asserted supplier

The accepted RS-25 record narrows SF.0's new work to relative Spec/general
relative Proj while importing the audited foundation. It does not supply
punctured-spectrum Hartogs, local Picard vanishing, the determinant lemma or
henselian smooth lifting. Route 1 nevertheless sends the first four items
there. `henselian-smooth-lift-import` is marked planned at SF.0 because
CMM21/044 is routed there, but /044 is itself explicitly missing. Under
PROTOCOL §16 that is not evidence of a layer already planning the statement.

**Repair:** move the punctured-spectrum, Hartogs and local-Picard items with
the common purity owner; remove the resulting empty SF.0 route. Place the
determinant input with the R03.3 regular-local factoriality proof, stating the
needed locally free/sheaf determinant interface rather than silently replacing
SGA 2 XI 3.15's ringed-space statement by an unrelated module statement.
Mark the smooth-lifting input missing and route it with SF.4's Elkik package,
cross-referencing CMM21/044 as the same obligation. Reuse the pinned
`HenselianRing R I`; its monic-root lifting definition is not already the
missing smooth-algebra equivalence. These corrections should agree with /1's
ownership map rather than create another implementation.

## Validation and handoff

- All four findings have exactly one confirmed verdict in the accompanying
  JSON; `scripts/check_redteam.py` passed.
- The read-only atlas assembly and provenance reproductions completed. The
  only counterfactual mutation was to an in-memory copy of the extraction.
- Intake `check-files` passed for the two deliverables; staged diff check passed.
- No extraction, errata record, generated data, script or Lean file was edited.
  No Lean was compiled; this job changes verification records only and no
  existing build at both pinned commits was available.

The follow-up fix should reconcile ownership and E1 in its authorized source
files, preserve the stated distinctions and histories, and hand the general
collation-tool defect to the maintainer. It must not treat this review as
certification that the published Duke text was obtained.
