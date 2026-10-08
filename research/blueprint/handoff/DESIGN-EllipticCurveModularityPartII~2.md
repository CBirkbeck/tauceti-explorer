# Handoff: DESIGN-EllipticCurveModularityPartII~2

Claude, session `claude-k6AGiJ`, 8 October 2026. Refs #6896. Base: origin/main at `df886aae`. The bot confirmed the claim
(comment 6057016157) before work began. This session wrote, reviewed and red-teamed none of the earlier work on this roadmap
or on `EllipticModularityEffectiveComparisons`.

## Result

**This roadmap duplicates an accepted one, so the revision plans nothing and proposes a merge.**

`EllipticCurveModularityPartII` and `EllipticModularityEffectiveComparisons` are the same roadmap planned twice:

| | `EllipticModularityEffectiveComparisons` (the owner) | `EllipticCurveModularityPartII` (this job) |
| --- | --- | --- |
| Title | Modularity and modular parametrisations of elliptic curves over Q, Part II: effective residual comparisons | the same |
| Parent | `EllipticCurveModularity` | the same |
| Source route | the Part II route of `PAPER-BENNETT-SIKSEK-20` (items 08, 09, 10, 57, 59, 60, 82), which names this roadmap | the same route, through the combined Part II design of the parent |
| Plan | 100 nodes over EC.0–EC.5 | 31 nodes over EC.1–EC.6, each restating a declaration of the owner |
| Review | accepted 6 October 2026 by `independent-review-REV-DESIGN-EllipticModularityEffectiveComparisons` (#6640); live in `data/blueprints/` | not accepted (`REV-DESIGN-EllipticCurveModularityPartII`, 7 October) |
| Cited by | `ErdosProgressionPowers`, `ArithmeticGaloisRepresentations`, the document of `EllipticCurveModularity`, the Bennett–Siksek route | `EllipticCurveModularityImaginaryQuadratic` only: the stage `EC.6` is listed as a user of two of its nodes |

Neither the first design round nor its review compared the plan with the owner's. I matched all 31 nodes with the owner's
declarations, reading each owner statement. Every one is owned, with one exception that neither roadmap plans: Chen's
theorem that the Cartan correspondence is an isogeny on the p-new quotient, which the owner uses, records as a gap and
assigns to a continuation of `ModularCurvesPartII` (the first version also left it as a gap awaiting a shared owner).
Where the two plans differed in substance, the owner is the more careful. In five places the first version stated more
than the owner does (the range of p in the formal immersion and the two integrality statements; Chen's isogeny;
finitely many exceptional primes in the repair of two-torsion; the norm inequality for a general element; twist
invariance at p = 3), and no exported theorem uses the wider form; `targetCoverage` says so entry by entry. PROTOCOL.md section 15 and this job's own rules forbid
planning what another roadmap plans, and section 9 says to keep working with the current structure and record a proposal.
The deliverables now do both:

- **Packet** (`status: complete`, 0 nodes, 0 errors and 0 warnings from the checker). `targetCoverage` gives, for each of
  the 31 targets, its statement, the owning declarations and how they cover it. `imports` lists the 66 declarations read
  (65 of the owner, one of `ArithmeticGaloisRepresentations`). The six stages have coverage `source_decomposed` with a note
  and their imports. `restructure` carries the merge proposal, and keeps the split proposal that
  `research/blueprint/splits.json` and the brief of `DESIGN-EllipticCurveModularityWild3Adic` refer to, with one sentence
  changed (the Bennett–Siksek direction is the owner's). `notesForOwner` has five observations for the owner's jobs.
  `sourceIssueReferences` cites the owner's three recorded mistakes in the sources by identifier. `requests` and `gaps` are
  empty. The `review` object is untouched.
- **Roadmap definition.** Six layers with the same keys and titles, each an import list; `prerequisites` are the parent and
  the owner; each layer requires the owner's layer that plans it.
- **Reader document.** Rewritten (about 6,900 words): the statements of the 31 targets with their owners, the conventions, where
  the owner's statements are narrower or wider than the sources, five remarks on the owner's statements, and acceptance
  tests.
- **Suggested file.** No signature of a target; a crosswalk from the names the file used to suggest to the owner's, and
  proofs of the arithmetic behind the acceptance tests (below).

The form follows two accepted precedents: `HabiroCyclotomicCompletions--HC.6` (a complete packet with no nodes, `imports`
and `targetCoverage`) and `HeegnerPointEulerSystems--HE.7s` (a layer with no nodes, coverage `source_decomposed`, a note and
its imports).

## For the maintainer: one decision

Keep one of the two roadmaps. The packet's proposal, in short:

1. **Recommended.** `EllipticModularityEffectiveComparisons` stays the owner, unchanged. `EllipticCurveModularityPartII` is
   retired. Its stages map to the owner's as EC.1 → EC.0 and EC.2; EC.2 → EC.1; EC.3, EC.4 → EC.3; EC.5 → EC.4; EC.6 → EC.5.
2. `EllipticCurveModularityImaginaryQuadratic` lists `EllipticCurveModularityPartII:EC.6` as a user of two of its nodes
   (`IQ.2/symplectic-twist` and `IQ.4/cartan-curves`: twice in the packet, twice in the document); these become
   `EllipticModularityEffectiveComparisons:EC.5`.
3. The cause is in the queue: `make_queue.paper_designs` groups every Part II route of one parent into
   `DESIGN-<parent>PartII`, and the Bennett–Siksek route had already been designed, and accepted, under the roadmap id it
   names. Listing `EllipticModularityEffectiveComparisons` among the split-off directions of the first decision in
   `research/blueprint/splits.json` would send that route to the design that planned it. `research/blueprint/focus.json`
   lists both ids under "Serre modularity".
4. If the id `EllipticCurveModularityPartII` is preferred for the survivor, rename the owner's files and identifiers to it.
   Either way the surviving plan is the owner's packet; this packet contributes no declaration.

Until then: `REV-DESIGN-EllipticCurveModularityPartII~2` is issued when this merges. Its reviewer has only the concordance
and the merge proposal to check. If it accepts, promotion adds this roadmap to the atlas as six layers without planets
under the owner's title. A dry assembly with the four files in a scratch copy of `data/blueprints` builds without error;
the six stage links to the owner's layers are then recorded as pending, because new roadmaps join the atlas in
alphabetical order and the owner's stages do not exist yet when this one is added.

## What the review asked for, and what became of it

`REV-DESIGN-EllipticCurveModularityPartII` sent the plan back for one reason: the reader contradicted the packet in the
places it lists. The reader is rewritten from the packet's data by one script, so the two agree, and none of the passages
it lists remains. Its thirteen in-place corrections concerned nodes that are no longer planned here. I checked the ones
with mathematical or supplier content against the sources and against the owner:

| Reviewer's correction | Checked | The owner's plan |
| --- | --- | --- |
| Martin's proof is §4, pp. 14–16, not §5 | Right: in arXiv v1, §4 has Lemmas 16–22 and the proof of Theorem 2; §5 is the table of values | cites §4 |
| Chen's curve is the quotient by w_{p²}, keeping the level at r | Right: Lemos sets X₀⁺(p²) = X₀(p²)/w_{p²} and X₀⁺(rp²) = X₀(r) ×_{X(1)} X₀⁺(p²) (pp. 3, 8) | the same |
| Darmon–Merel prove Proposition 7.1, Theorem 8.1 and Lemmas 8.2–8.3 for r = 2, 3 only | Right (author copy §§6–8; Lemos Theorems 1.2–1.3) | the same; the extension to r = 5, 7, 13 is one of its gaps |
| No residue characteristic 2 or 3 arises in the formal immersion | Right, and more: a prime q ≡ ±1 mod p with p ≥ 11 is at least 2p − 1 (proved in the suggested file) | states the node for p > 37 only; see note 2 below |
| R15.2 does not state a Sturm bound modulo an ideal | Agrees with the owner | cites R15.2 as the stage, records the missing statement as a gap and proposes a continuation that owns it |
| The weight-two Eisenstein series belongs to upstream ModularForms Layer 0 | Right: Layer 0 specifies the combinations E₂(z) − t·E₂(tz) at the exceptional weight 2 | cites Layer 10 and R15.2 instead; note 5 below |
| Coarse moduli of Γ₀(r) from upstream ModularCurves Layer 9 | Not adjudicated | uses `ModularCurvesPartII` R12.3 and R12.5 for level structures and point tables |
| R01.4 gives finite-group facts only; Serre's and Bilu–Parent–Rebolledo's exclusions are arithmetic | Agrees with the owner | plans both as its own nodes |
| The mod-4 argument needs Chebotarev on E[4], not semisimple recognition | Agrees with the owner | plans it in three nodes; note 3 below gives a shorter argument |
| Statements with explicit quantifiers; source `match` texts; baseline entries | No longer applicable: no node, no baseline citation | — |

The first version recorded no mistake in a source. The owner records three, confirmed by its review, among them the false
claim in Lemos's preprint that the Jacobian of X₀(37) has rank 0; the packet cites them by identifier.

## For the owner's jobs

`notesForOwner` in the packet, for `RT-DESIGN-EllipticModularityEffectiveComparisons` and any fix or follow-up of the owner.
None is an error in a statement.

1. With full rational two-torsion E[ℓ] is irreducible already for ℓ = 5 (20 is not a cyclic isogeny degree); ℓ = 3 fails.
2. The range p > 37 in `EC.5/cartan-cusp-formal-immersion` and `EC.5/cartan-denominator-exclusion` is not forced by small
   residue characteristics; Lemos states both for every prime p outside {2, 3, 5, 7, 13}.
3. A proof of `EC.3/four-count-full-two-selection` on E[4] alone, without a Weierstrass model. Its group theory, a
   statement about subgroups of GL₂(ℤ/4), is proved in the suggested file.
4. A locator: the statement that the correspondence kills the p-old part is Lemma 3.2 of Lemos's preprint, not
   Proposition 3.2.
5. A supplier: `EC.3/odd-eisenstein-series` should rest on upstream ModularForms Layer 0.

## Suggested file

`research/blueprint/suggested/EllipticCurveModularityPartII.lean` **elaborates**: `lean-check` (one `lake env lean` in the
shared build, Mathlib `082e2d37e8`), no errors and no warnings. It imports Mathlib only and contains no proof placeholder.
It states no target of the roadmap. It proves: (√2 + 1)² = 3 + 2√2, (√12 + 1)² = 13 + 4√3 and the inequality between them;
that a prime q ≡ ±1 mod p with p ≥ 11 prime is at least 2p − 1; that a nonzero rational t with f(t)/t an integer, for a
monic integer polynomial f of degree at least 2, is an integer dividing f(0); and the statement on subgroups of GL₂(ℤ/4)
of note 3. These are checks of the index and of the notes, not implementations of any node; every node of the owner stays
`unchecked`. No language server and no build was started.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularityPartII.json`, with and without the
  pinned declaration index: 0 errors, 0 warnings; 6 stages in scope, all planned in the checker's sense.
- `research/blueprint/intake.py check-files` on the five files: 0 problems.
- `check_blueprint.py` on `EllipticCurveModularityImaginaryQuadratic.json`, which cites this roadmap's stage EC.6:
  still 0 errors, 0 warnings.
- The generator checks that every one of the 31 former node ids has a `targetCoverage` entry and that every cited
  supplier id exists in the owner's packet or in `ArithmeticGaloisRepresentations.json`.
- Recomputed: the five polynomials f_r are monic of degree r + 1 with constant terms 4096, 729, 125, 49, 13, and their
  integral j-sets have 25, 13, 8, 6, 4 elements, as the owner states.
- The concordance, the mathematics of the notes and of the reader, and the facts in the merge proposal were read again
  by a second reader that was given the files and not my conclusions. It confirmed the 31 correspondences, the four
  notes it saw and the repository facts, and found fifteen points, all corrected in what is submitted: a missing range
  (p > 37) in one statement; Chen's isogeny described as owned when it is the owner's gap; the wild 3-adic continuation
  described as an existing roadmap when it is a pending design; sentences saying "the owner proves" where the owner
  plans or requests; the hypothesis "all but finitely many primes" of Kraus's repair, which the owner narrows; a non
  sequitur about M₀ in the reader; incomplete owner layers for EC.2 and EC.5; and smaller wording.

## Sources

Fetched again on 8 October 2026 with certificate validation; the five SHA-256 hashes equal those in the packet.

| Source | Read in this round |
| --- | --- |
| [Bennett–Siksek](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), published | §2 (Theorem 3, Lemmas 2.1–2.2, the thresholds, Theorem 4), pp. 358–360; the first lines of the proofs of Lemmas 3.3 and 3.5, pp. 362–363 |
| [Kraus](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf), published | the end of §3.3 (the isogeny of degree at most 2), p. 1146 |
| [Martin, arXiv math/0306128v1](https://arxiv.org/pdf/math/0306128) | Theorem 2 and the headings and lemma numbers of §§4–5 |
| [Lemos, arXiv:1702.01985v2](https://arxiv.org/pdf/1702.01985v2) | Theorems 1.1–1.4, Propositions 2.1–2.2, the proof of Theorem 1.1 as far as the sets S₁₁, S₁₇, S₃₇, Theorem 2.3, all of §3 |
| [Darmon–Merel, author copy](https://perso.imj-prg.fr/loic-merel/wp-content/uploads/merel-pub/winding.pdf) | the statements of Proposition 7.1, Theorem 8.1 and Lemmas 8.2–8.3 and the standing restriction r = 2 or 3 |

Also read: the whole of the owner's packet (100 nodes, gaps, source findings, restructure proposals), the upstream
ModularForms document for Layer 0, and `make_queue.py` for how the two design jobs arose. Not read again: Mazur. Not read:
the owner's other sources (Serre 1981, Bilu–Parent–Rebolledo, Banwait–Najman–Padurariu); nothing here depends on them
beyond the owner's statements.

## Where to resume

Nothing remains to plan under this id. If the merge is applied, there is nothing to resume. If the maintainer keeps this
id as the survivor, the work is a renaming of the owner's packet, document and suggested file, with `targetCoverage` as the
map from the old node ids of this roadmap to the owner's. The scratch directory is deleted; everything another worker
needs is in the five files of this job.
