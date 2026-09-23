# Independent review: Chebotarev links

**Accepted with corrections to two overlap recommendations.** All 15 directed
links are retained; no link is removed or added. The three overlap records
remain. The review resolves two unnecessary construction obligations by
checking declarations in the pinned libraries.

Reviewer: Codex, session `codex-hjdg0j`, 23 September 2026. Job
`REV-LINK-tauceti_TauCetiRoadmap_Chebotarev`, issue #88. Original worker:
ChatGPT Pro, session `cgp-780fc5e50f71`; this reviewer did not write that packet.
The claim was confirmed by the workflow before substantive work started.

## Material inspected

Repository snapshot: `4b3641a4f904237c25db793625a8f3b00c29b1b3`, obtained through
the GitHub archive API. Read the whole 743-line Chebotarev document, all full
stage descriptions at the 15 links' endpoints, all overlap endpoint
descriptions, and the original packet and handoff. Read the additional stages
listed in the completeness checks below and the relevant campaign context.

The catalogue has 218 roadmaps and 2,007 stages after including the six
additional roadmap definitions. The original 218-entry screen remains the
author's catalogue-wide record; this review does not claim to have reread
every entire roadmap. It performed independent searches over the full stage
catalogue and targeted full-text reads.

The reviewed library audit in `data/library-coverage.json` records AUDIT-03's
Chebotarev findings, independently checked by REV-AUDIT-03. In particular,
Layer 11 is partly built and its tail estimates already exist. I used the
audit as a lead and read the declarations below at the actual pins, rather
than treating its summaries as proof of a declaration's exact scope.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. No updated-library theorem is used
as evidence for the pinned baseline.

## Every directed link

Both endpoint descriptions were read in full. All evidence excerpts remain
literal substrings of the named stage or its owning roadmap document: the
supplemental check uses exact strings, without whitespace normalization.
Directions are supplier → consumer.

| Link | Verdict and mathematical check |
|---|---|
| CH-L01 | Keep, explicit. Global Number Fields Layer 2 supplies the modulus and ray-class carriers needed to state Chebotarev Layer 4's conductor. The carrier does not prove the cyclotomic conductor formula. |
| CH-L02 | Keep, explicit. Global Number Fields Layer 9 supplies the least ray conductor of the appropriate finite-order character. Layer 4 still constructs the cyclotomic character and compares its conductor; this is not a claim that every finite-order ideal weight already factors through a ray group. |
| CH-L03 | Keep, explicit. The same supplier defines the precise ray-character carrier and modulus-change operations used in Layer 5. The consumer's factorization is a separate theorem. |
| CH-L04 | Keep, explicit. Class-by-class ideal counting with a common main term and uniform power saving supplies nontrivial-character cancellation. Total ideal counts or mere finiteness of a ray group would not suffice. Analytic continuation remains with Chebotarev. |
| CH-L05 | Keep, inferred. The prime-conductor ramification specialization of Global Number Fields Layer 10 gives total ramification in Q(ζ_q). Unramifiedness of q in K then forces trivial intersection and full cyclotomic degree. The consumer still proves disjointness and chooses q. |
| CH-L06 | Keep, inferred. Arithmetic Dirichlet Series Layer 5's convergence/density-zero bound removes primes of E with residue degree above one over K: relative degree above one implies absolute degree above one. This permits the degree-one contraction used in Layer 10. No weighted estimate is inferred from density zero. |
| CH-L07 | Keep, explicit. Layer 10 supplies finite-quotient Frobenius density for R01.5. Continuity, common coefficients, semisimplicity, characteristic-polynomial recognition and descent obstructions remain in R01.5. |
| CH-L08 | Keep, explicit. R27.1 needs primes in a nonempty compatible Frobenius class outside finitely many exclusions. Density supplies existence only after the compatibility and image conditions have been proved. |
| CH-L09 | Keep, explicit. R29.4 explicitly invokes Chebotarev in comparing the elliptic and automorphic representations. Recognition is reused from R01.5; the edge does not assert that density determines bad-prime monodromy or the exact conductor. |
| CH-L10 | Keep, explicit. The identity class in the relevant finite splitting extension supplies ET.3's split prime outside an enlarged finite exceptional set. The qualitative theorem gives no numerical least-prime bound or transfer identity. |
| CH-L11 | Keep, explicit. ES.1 names the joint representation/cohomology extensions. Chebotarev supplies compatible Frobenius primes, while the consumer proves simultaneous nonzero localization and independence. The old opaque prerequisite is not a second new edge. |
| CH-L12 | Keep, explicit. R04.5 uses prescribed Frobenius in the residual/cyclotomic/cohomological compositum. Its image hypotheses and dual-Selmer reduction are additional inputs, not consequences of density. |
| CH-L13 | Keep, explicit. HE.5 expressly applies Chebotarev to the residual and class-cutting fields. ES.1 supplies the shared simultaneous-localization machinery; local cartesian, Tamagawa and torsion checks remain independent. |
| CH-L14 | Keep, explicit. IHG.4 uses density for uniqueness of continuous finite-quotient determinant data. Polynomial-law existence and integrality over nonreduced rings are not supplied by density. |
| CH-L15 | Keep, explicit. PA.4 needs auxiliary primes with compatible congruences and eigenvalue conditions. The image argument, cardinalities and boundedness/ultrapatching conditions remain consumer obligations. |

No link rests merely on the occurrence of “Frobenius,” “orthogonality” or
“auxiliary primes.” The existing reasons correctly state these mathematical
boundaries and are retained.

## Every overlap

**CH-O01 — rescope, retained.** AN.4 combines an unspecified Chebotarev
endpoint with broader Hecke/Dedekind/Artin analytic interfaces. The dedicated
Chebotarev roadmap owns its qualitative theorem and cyclotomic continuation
route. Keep AN.4's comparisons and applications, make the imports explicit,
and avoid adding an Artin-L-function proof as an unstated prerequisite.
The retired FoundationsAndLibraryIntegration endpoint is not a supplier.

**CH-O02 — keep, owner clarified.** Both texts mention rational cyclotomic
Frobenius. Number Field Arithmetic Layer 2.6 explicitly owns that reusable
computation. Global Number Fields Layer 10 owns the rational ray-class/carrier
comparison, while Chebotarev Layer 4 forms the ideal weight and its general
number-field specialization. The revised recommendation names Layer 2.6 as
the common owner. The existing Number Field Arithmetic Layer 2 → Chebotarev
Layer 4 link already records the dependency; no duplicate is added.

**CH-O03 — keep, baseline correction.** The original recommendation called
for an irreducible-character/one-dimensional-character comparison before a
direct import could be asserted. That is unnecessary for this consumer.

At the Tau Ceti pin,
[`CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean)
already states the tagged column sum for `G →* Mˣ`, with G finite commutative
and M a domain having enough roots of unity. Set M=C, take
`g=Frob(𝔭)^m`, and divide by the nonzero group order. This gives exactly the
indicator used in Layer 11. The inverse is on the tag σ. The prime-weight
specialization is already
[`AlgEquiv.sum_inv_mul_galoisCharacterWeight_apply_of_unramified`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Chebotarev/GaloisCharacter/Orthogonality.lean),
with explicit number-field, Galois, commutativity and unramifiedness hypotheses.
The full logarithmic-derivative assembly is not asserted to exist.

Mathlib also has the complex additive formulation
[`AddChar.sum_apply_eq_ite`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean)
under finite additive-commutative-group hypotheses. Its `AddChar.toMonoidHomEquiv`
explains the additive/multiplicative translation. The Tau Ceti theorem already
uses the consumer's units-valued carrier, so no new comparison theorem or
Character Theory → Chebotarev link is needed. Character Theory retains the
general nonabelian irreducible-character package.

## Completeness spot checks

Searches covered Chebotarev/Frobenius density, prime existence and auxiliary
primes, ray-character cancellation, higher prime powers and Tauberian inputs.
All 14 Chebotarev descriptions were read; the following ten layers received
focused supplier/consumer checks.

| Chebotarev layer | Search and outcome |
|---|---|
| 1 | Artin symbols, tower laws and conjugacy powers: Number Field Arithmetic Layers 1–2 already supply the incoming links. No replacement Frobenius carrier is planned. |
| 3 | Prime sums, Euler products, normalization and density calculus: Arithmetic Dirichlet Series Layers 3 and 7 explain the existing path and normalization obligations. No new shortcut from the zeta residue is justified. |
| 4 | Moduli, cyclotomic Frobenius and character sums: CH-L01–02, the existing Number Field Arithmetic link and the pinned character-sum theorem cover the inspected interfaces. |
| 5 | Ray-class ideal counts, cancellation, Abel summation and positivity: CH-L03–04 and existing Arithmetic Dirichlet Series links cover these. No global-reciprocity edge is inserted. |
| 7 | Cyclotomic ramification, prime choice and crossing: CH-L05 plus existing number-field arithmetic links supply the exact inputs. Disjointness alone does not establish cyclotomic degree. |
| 10 | Representation recognition and prime-selection searches recovered CH-L07–15 and the three existing Lawrence–Venkatesh requires edges. The dimension-n deformation and higher-weight Heegner candidates already have paths through their shared owners. |
| 11 | Powered Frobenius filters and orthogonality: the pinned character sum and tail comparison resolve baseline work; generic Euler-product assembly stays with the existing supplier. |
| 12 | Wiener–Ikehara and boundary data: Arithmetic Dirichlet Series Layer 9 is already linked. Continuity at s=1 alone is not the required whole-line boundary input. |
| 13 | Prime-power removal and theta-to-count: existing Arithmetic Dirichlet Series Layer 10 link suffices after the powered-filter tail comparison. |
| 14 | Natural-density denominator and agreement: existing generic transfer/density links suffice. Dirichlet density by itself is not a supplier of natural density. |

Additional full candidate reads included GlobalGaloisDeformations G7,
ClassicalSerreModularity R33.2, ArithmeticGaloisDuality R02.5,
EulerSystemsAndKolyvaginSystems ES.0 and GeneralizedHeegnerCycles GH.5.
For example, the recorded paths include Layer 10 → R04.5 → R04.6 → G7 and
Layer 10 → ES.1 → ES.2 → ES.3 → GH.5. A path is not a proof that every
consumer hypothesis is discharged; these candidates did not establish an
additional unrepresented direct supplier contract.

Negative checks retained: function-field/closed-point Chebotarev has
constant-field and degree restrictions absent from this number-field theorem;
polynomial-Galois-group certificate soundness explicitly does not require
prime-search termination; a hypothesis that a good split prime has already
been chosen is not automatically a new existence theorem. ZerosOfLFunctions
remains an unregistered named consumer in this snapshot, so no endpoint is
invented. No additional directed link was established by this spot check;
`review.added` is therefore empty.

## Source obligations and the second baseline correction

The original handoff's source/interface issues are not proof closure. The
finite-Euler-factor residue correction CH-S01 is valid: deleting the factor
at 2 from ζ_Q changes its residue to 1/2, while its negative logarithmic
derivative retains pole coefficient 1. CH-S02's whole-boundary issue and
CH-S03's missing abelian restriction remain document obligations. CH-S05's
cyclotomic ray-character factorization remains consumer work.

For CH-S04, however, the needed comparison is already built. At the Tau Ceti
pin, read in full in
[`PrimeCounting/VonMangoldt.lean`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.lean):

- `NumberField.Chebotarev.frobeniusPsi_sub_frobeniusTheta_eq_primePowerSummatory`
  identifies the powered-filter higher-prime-power tail.
- `NumberField.Chebotarev.frobeniusPsi_sub_frobeniusTheta_le` bounds it by
  the all-prime tail.
- `NumberField.Chebotarev.frobeniusPsi_sub_frobeniusTheta_isLittleO`
  supplies the required o(x) statement for any conjugacy class in a finite
  Galois number-field extension.

The packet now records that CH-S04 requires aligning the source wording with
these declarations, not constructing the tail theorem again. It still must
not identify the powered-filter ψ_C with the fixed-set `primePsi`. Source
READMEs and other jobs' handoffs are outside the permitted edits.

## Validation

`scripts/check_links.py` passes: 15 links, three overlaps, 218 examined
records, zero errors and zero warnings. Intake file validation also passes.

An independent supplemental script checked all 37 literal quotations,
endpoint ownership, retired endpoints, duplicate pairs and the graph after
including every stage's `requires` edges as well as all other link packets.
The graph has 4,429 distinct edges before this packet and 4,444 after it;
both are acyclic. All 218 examined roadmap IDs are unique and match the
catalogue. No proposed pair duplicates an already recorded edge.

The job's instruction forbids the git command, so archive and GitHub API
operations are used for the working snapshot and submission. A whitespace
scan replaces `git diff --check`. No Lean file was changed or compiled.
The review accepts dependency direction, scope and evidence; it does not
claim a completed mathematical proof or formalization of Chebotarev.
