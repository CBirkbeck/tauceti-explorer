# PKG-SerreWeightAndLevelOptimisation handoff

Completed by Codex, session `codex-u4PLfc`, for issue #9780 on 2026-10-14.
This is a complete package submission, not a checkpoint. Independent package
review remains the next workflow step; this author has not performed that job.

## Deliverables and completeness

- The package README contains all 62 targets of the accepted packet, in six
  layers with respective counts 4, 13, 14, 8, 11 and 12. It retains all 58
  definition API entries, all 21 named definition tests, all 185 acceptance
  checks, all 37 exact supplier contracts, the worked examples, and the
  seven-case classical optimisation manifest. Every target has its own
  hypotheses, source locators, proof route, prerequisites and Checks.
- The packet has one more target than its older reader: dyadic auxiliary
  involution level raising with a₂ preservation. This is included as 5.5;
  no target was omitted because it was absent from the reader.
- `Suggested.lean` has 128 lines. Its only data definitions are the existing
  submodule quotient specialization `levelChangeGluing` and the arithmetic
  `reducedLevel`, both with real bodies. It states eight theorems and four
  discriminating examples. All other carriers, four heavier definitions,
  APIs and milestones remain in the README. It contains no sorry'd data,
  auxiliary theory development or fabricated geometric carrier.
- `metadata.toml` is the single line `topic = "math.NT"`.
- The accepted packet, reader, older suggested file, atlas data and upstream
  repositories were not edited. No higher-tier notion was moved into R20.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/SerreWeightAndLevelOptimisation.json`:
  passed, zero errors and zero warnings. This validates the unchanged input;
  it is not a claim that its mathematical targets are formalised.
- `lean-check research/blueprint/packages/SerreWeightAndLevelOptimisation/Suggested.lean`:
  passed with exit code zero and exactly twelve `declaration uses 'sorry'`
  warnings, no errors or other warnings. Checked available memory first and
  ran only this one Lean elaboration. No language server or Lake build/update
  was started.
- Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`.
- Mechanical inventory: all 62 target anchors and numbered subsections,
  all 58 API names and 21 test names, all 37 suppliers, six Examples and
  Dependencies sections, and all internal target links checked successfully.
- `python3 research/blueprint/intake.py check-files` on all four deliverables:
  passed, four files and zero problems.

## Corrections to carry back to the input plan

Only the authorized package files were changed. These points should be
reconciled with the packet and older reader by their appropriate follow-up,
without replacing the more precise package statements by the older wording.

1. **Edixhoven locator and notation.** The exceptional self-extension
   comparison is **Remark 4.4, author p. 10**, not “Definition 4.4,
   pp. 11–12.” Theorem 4.5 remains on author pp. 11–12. The author revision
   uses `k_ρ` for classical Serre weight and `k(ρ)` for minimum Katz weight;
   the package's symbols are reversed, as explicitly declared in Conventions.
   The local exception retains the actual extension, which can be ramified,
   unramified or nonsplit. The introductory Coleman–Voloch update belongs
   to the 24 December 1998 author revision, not the original 1992 printing.
2. **Hasse injection normalization.** In 3.14, the kernel/socle calculation
   is `VF=α⁻¹F`. With `T_p=U_p+〈p〉V`, `UF=αF`,
   `T_pF=(α+β)F` and `〈p〉F=αβF`, one has `αβVF=βF`.
   The older proof step, also appearing in the acquired CG20 Lemma 8.14
   proof on printed p. 866, writes `VF=βF`; this needs `αβ=1` under
   those operator conventions. No such assumption is present. The corrected
   equation also agrees with `UV=id`. The α=2, β=3 example over F₇
   gives `VF=4F`, not `3F`. The first nonzero cuspidal exponent still
   gives the contradiction, so the theorem and proof route are retained.
3. **Coherent weight-one module.** The minimal ideal's construction uses
   R15.1's coherent/torsion weight-one Hecke module. Current ModularForms
   layer 8W supplies the characteristic-zero liftable lattice branch,
   not by itself a nonliftable torsion weight-one eigensystem. Finite
   O-generation does not imply flatness or generic étaleness here.
4. **KW witness choice.** In Theorem 8.2's p=2, `k(ρ)=2` case, the
   chosen initial π may be α **or** β; both are hypotheses. The older
   reader's β-only row is too narrow. Σ avoids p for α and contains
   the starting Steinberg p-places in the β weight-two branch.
5. **KW arithmetic character and simultaneous types.** Section 8.1's ψ
   is arithmetic and unramified outside p. Theorem 8.4 chooses one A/B/C
   branch simultaneously at all p-places: A has a common crystalline
   weight k, B and C have weight two, and B retains its fixed inertial
   parameter across embeddings. “Common weight k” must not silently
   prescribe weight k for B/C. Allowable changes have even degree;
   degree-one identity restriction obeys the transport law but is not an
   allowable extension under Definition 7.9.
6. **Existing library hypotheses.** The pinned `Newform` contains
   away-from-level eigenform data, not bad-prime U-operator fields.
   `DirichletCharacter.changeLevel_injective` needs nonzero destination
   modulus m; `changeLevel` itself needs only n dividing m. The diagonal
   matrix in `levelRaise` has determinant d, whereas `HasDetOne` is
   required of the target subgroup.
7. **KW proof comparison.** The older supplemental prose about a
   “dyadic cohomological argument” is replaced by the exact paired
   coefficient-space residual Hecke-image comparison
   R18.3/`tw-twist-reduction-image`. It is the same liftable Hecke image,
   not all mod-p invariants or an integral Hecke-module isomorphism.

## Source verification and retained gap

The sixteen public source URLs in the packet were acquired. Fifteen files
matched their recorded SHA-256 hashes. The current Buzzard publisher PDF has
SHA-256 `4182b70af0dd904e71db9154764c31558d16fd3d65c77c65b5e45b7b805fcd8f`,
rather than the packet's hash; the publisher adds a download stamp. Its
article, pagination 95–110, statements and relevant proofs were checked.
Edixhoven's public DVI matched the recorded hash; the same author's public
PostScript companion was rendered to read the 1998 revision. Only public
paper files were kept in scratch, and no source passages were put in the
repository. The maintainer library index was checked; no uncleared book was
read or copied.

The following are especially consequential source checks, expressed here
in our own words rather than as source excerpts:

| Source and location | Contract checked |
| --- | --- |
| Ribet94 §§1–7, author pp. 2–27 | Character restriction ℓ≥5; Theorem 2.1's four coefficient-prime steps; Theorems 2.2, 3.3, 4.1, 5.1; the two character-group sequences and §7's weight-two trivial-character lowering, including existing ℓ-power level |
| Buzzard00 pp. 96–109, especially 103–106 | Full-Hecke universal multiplicity, nonsplit Jordan case, non-Q(i) auxiliary removal, Theorem 2.8's needed unramifiedness, auxiliary involution a₂-preserving raising, and the Γ1 false-point character sequence |
| Edixhoven author pp. 2–3, 5–7, 10–12 | Ordinary/supersingular local statements, weight-p+1 boundary, exceptional self-extension, classical versus Katz weight and the later companion update |
| Coleman–Voloch author pp. 1–3 | The proved ordinary range 2<k≤p for p>2, equal-character endpoint and complete odd-characteristic weight-one unramifiedness |
| Gross90 pp. 477–479, 497–499 | Genuine filtration-p+1 differential quotient, low-characteristic character obstruction, one-way companion splitting and the older converse qualification |
| Wiese04 Theorems 9–10, pp. 130–132 | Dihedral Katz realization, conditional odd-characteristic conductor/weight theorem and the attribution to Diamond's general-character theorem |
| Wiese07 pp. 69–79 | Exact Situations I/II, ordinary residue sequence, Frobenius comparison, full versus anemic ideals, socle multiplicity formula and dyadic weight-one-witness hypothesis |
| CG18 author pp. 20–22, 65–66 | Minimal coherent ideal and ordinary connected Tate rank-one/Z_p-dual étale sequence without a Gorenstein assumption; ownership of the new upper bound |
| CG20 Lemma 8.14, printed pp. 865–866 | Two-step Hasse/projector injection, whole-module nilpotence, torsion powers and the corrected V-scalar calculation above |
| BCG25 proof of Theorem 2.4, p. 515 | Companion application and cyclotomic normalization, distinct from the higher-rank theorem itself |
| Bennett–Siksek20 equation (3), Theorem 3, Lemma 2.1, pp. 358–359 | Exponent-valued M₀ filter including q=ℓ, conditional weight-two newform and removed-prime sign/trace contract |
| KWII Definition 7.9 through §8, author pp. 68–78; KWI Lemma 6.2(i), p. 11 | Allowable changes, determinant alignment, α/β and Σ branches, simultaneous A/B/C types, final quadratic twist removal and the independent dihedral base case |
| Kisin09 §3.1, pp. 1145–1152; Lemma 3.5.3, pp. 1168–1169 | Standing p>2 hypothesis, determinant-covariant Gram matrix, whole-module defect/nonzero support, and the quadratic tower |
| IKM24 §2.2, Proposition 2.10, and §3.8 | Torsion-free quotient in the congruence functor, its ideal, depth qualification and functoriality; this is IHG.1's generic ownership |

**One inherited source-access gap remains, unchanged in scope:** Diamond,
*The refined conjecture of Serre* (1995), Theorem 1.1, proceedings pp. 22–37.
Wiese04 Theorem 10 and its proof on pp. 131–132 identify the exact full
odd-characteristic conductor/weight statement and this primary source.
Ribet94's trivial-character proof does not justify arbitrary nebentypus,
nonsquarefree exponent defects or the general characteristic-three dispatch.
An accessible complete primary proof was not established, and those
proceedings are not cleared by the maintainer's index. This affects 2.13,
the conductor-level existence branch of 3.13, 4.8 and 6.4. The README keeps
Diamond's theorem as an explicit additional proof input, rather than
claiming the gap is resolved. A source follow-up needs a cleared copy and
must check its character, exponent and coefficient hypotheses. The package
job can be reviewed independently with this already accepted limitation.

## Existing ownership audit

The current read-only TauCetiRoadmap checkout was checked at
`0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library
at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, in addition to reading the
eleven cited declarations at the pinned commits. The reviewed library
coverage audit and the roadmap links were read. The existing ModularForms
and ClassFieldTheory READMEs were read in full as the writing models;
current changes and the relevant Suggested files were checked as well.
The additional nine current roadmaps and Completed roadmap directories
were searched for these mathematical objects and relevant definitions.

| Existing owner | Package treatment |
| --- | --- |
| Tau Ceti complex old/new and `Newform` | Imported; relative q-new and integral saturation remain distinct application contracts |
| Current ModularForms layers 0, 2–4, 6, 8W, 8G | Import primitive Eisenstein, U/trace/partial-W conventions, analytic theory, weight-one lattice and coefficient-Galois stability |
| Current ClassFieldTheory layers 7 and 11; LocalGaloisGroups | Import arithmetic reciprocity, unit/conductor comparison and global extension conditions; no generic local Galois theory is replanned |
| Current IntegralLattices | Its quadratic integral-lattice discriminant gluing does not supply the arbitrary DVR Hecke submodule quotient here; the latter uses existing Mathlib quotients |
| Current Tau Ceti `ConductorDichotomy` | Its analytic period/level dichotomy does not supply residual Artin conductor or geometric lowering |
| R01/R07/R11/R14/R15/R17/R18/R19 and IHG.1 | Keep the packet's exact supplier boundaries, including coefficient, geometric and low-characteristic extensions; do not duplicate their constructions |
| R27 and R29 | Downstream consumers only; no proof prerequisite on their final modularity theorems |

No accepted target was deleted. In particular, 5.10 is explicitly an
application/import of R17.6's dihedral realization, not a repeated
construction. The generic congruence functor, analytic old/new objects and
weight recipe are likewise imports. The refined integral, dyadic and
quaternionic variants say what their earlier suppliers must provide.

## Adversarial pass

All six layers were read back against their accepted target inventory and
source/hypothesis boundaries. The following instances check the most
failure-prone definitions, signs, quotients and cases.

| Statements checked | Instance or negative control | Outcome or change |
| --- | --- | --- |
| 1.1–1.4 integral degeneracy, gluing, congruence, support | O² coordinate lines; saturated (1,0)/(1,π); identical lines; multiplying a basis vector by π | Quotients respectively 0, O/(π), O; the last map is not saturated. Keep finite-free residue support separate from Jacobian torsion |
| Generic congruence application | A={(a,b):a≡b mod π}, λ=a | Annihilator gives η=(π), Ψ(A)=O/(π); this does not identify every lattice gluing quotient |
| 2.1–2.13 conductor defects and geometric lowering | q³ initial exponent versus residual q²; odd complex-conjugation class; pre-existing ℓ-power level | Retain full exponents and wild part; q≡−1, trace zero and cyclotomic determinant agree; weight-two lowering remains separate from small-weight Ihara |
| Auxiliary-prime API | q dividing the level, q=ℓ, changed residual coefficients | Bad primes rejected; joint quotient and coefficient transport retained; no unconditional predicate on the prime alone |
| 3.1–3.9 local weights and companions | Equal roots with a nontrivial unramified Jordan block; finite-flat weight-two Hasse multiple; k=p | Actual extensions retained; Hasse multiple excluded from nonfinite p+1 conclusion; tame at k=p need not split |
| BCG companion application | q-expansion arithmetic of ΔE₄²E₆ modulo 107 | Independently computed a₁₀₇=106=−1 and companion weight 82; arithmetic twist exponent 25 retained |
| 3.10–3.12 ordinary sequence and multiplicity | Non-Gorenstein Hecke algebra; socle dimension three; omitted T_p | Z_p-dual need not be free over T; r=2; full/anemic factors kept separate, and the p=2 witness is required |
| Minimal weight-one ideal API | Wrong trace, wrong diamond, two distinct ordinary roots, nonliftable torsion | Wrong generators rejected; both roots contract to the same away-p ideal; no automatic finite-flat algebra claim |
| Hasse injection | α=2, β=3 over F₇; repeated/zero root; large torsion exponent | Correct V-scalar 4; distinct nonzero roots required; choose sufficient power so p^h vanishes and away-p weight factors agree |
| 4.1–4.8 level/character operations | Order-ℓ square-root twist versus order two; inverse coefficient Frobenius; ℓ=3,N≤3 | Odd square-root step works; actual U construction lowers depth; fixed-character and small-level restrictions retained |
| Trace normalization | Partial W²=ε(ℓ), F|W|U_ℓ term | Keep ε(ℓ)⁻¹ℓ^{1−w/2}; g|W has valuation at least 1+a/2 and sufficiently large i kills the term |
| Buzzard multiplicity API and 5.1–5.9 | One versus two full-Hecke copies; wrong level parity; one good level only | Dimensions 2 versus 4, universal quantifier and finite-flat level convention preserved |
| Dyadic auxiliary geometry | Nonzero-trace r≡3 mod 4 versus Jordan involution; ramified removed q | Distinct auxiliaries; preserve a₂; corrected unramifiedness required; Γ1 false-point sequence not replaced by Γ0 Ribet geometry |
| 5.10–5.11 and 6.5 scalar/dihedral boundary | Conductor-229 nonliftable dihedral example; same-root nonscalar extension | Dihedral Katz witness admitted; scalar conclusion applies to the whole representation; R27 completion stays downstream |
| Reduced-level API and 6.1–6.4 | M=33,ℓ=3; M=141,ℓ=3/7; M=45,ℓ=7; M=1 | M₀ respectively 11, 141/47, 9, 1; coefficient prime may disappear; higher conductor exponent is retained |
| Elliptic exports | q=ℓ at removed prime; residual modularity only; ℓ dividing M | Removed-prime trace excludes q=ℓ; large-good-prime theorem does not assume E modular; bad coefficient primes excluded |
| KW data API and 6.6–6.8 | k(ρ)=2 choices (i)/(ii); degree-one identity; field shrinking image; residue degree two | Both unit types are 1; identity not allowable; bad field rejected; Steinberg coefficient dimension p² |
| 6.9 quaternionic raising | Gram columns (Nq+1,T_q), (T_q,ψ(π_q)(Nq+1)); p-torsion stabilizer | Determinant (Nq+1)²ψ−T_q²; singularity alone insufficient. Kisin p>2 and separate KW p=2/q|p branch retained |
| 6.10–6.12 tower, types and manifest | Same square but opposite unramified γ; mixed A/B/C; temporary r₀ | Further extension kills quadratic twists to the selected γ; mixed branches rejected; r₀ removed; all seven export cases remain |

## Where to resume

No package writing or Lean fix remains. The independent reviewer should
start with the four package deliverables, compare the 62-target packet
inventory (rather than the stale 61-target reader), and check the corrections
and inherited Diamond gap above. The public source URLs and exact page
locators are in the README; scratch copies are disposable. The generic
supplier extensions are future formalisation contracts, not already proved
Lean results. Any later source repair or propagation into the input plan
must use the appropriate separately authorized job.
