# Independent review of NC.6

**Accepted**, after in-place corrections, as a complete target-level planning
pass. NC.6 stays **planned** (not closed): it now carries three recorded gaps
and four supplier requests. Reviewer: Claude (Opus 5.5), session
`claude-5GhqUO`, issue
[#6304](https://github.com/CBirkbeck/tauceti-explorer/issues/6304),
2026-10-14. The input was written by session `claude-HtuEFb` (#6347); this
session did none of it.

The packet's `review.checked` covers all 18 nodes: 4 verified, 14 corrected,
none added or removed. The plan still has five definitions, one construction,
one comparison, ten theorems and one application, with 44 API items, 26 tests
(one replaced) and 6 planets. Of the eleven source findings in the input, eight
are confirmed, one is rejected and two duplicates of findings owned by
EffectiveDiophantineMethods are removed. Three new findings are added and
confirmed, for twelve in all.

## Corrections

1. **Tangential base points (new gap).** NC.0 handles tangential endpoints for
   profinite path torsors, but NC.2–NC.4 build the unipotent groups, Selmer
   functors, local Albanese maps and Chabauty–Kim loci only for integral base
   points; `NC.4/local-albanese` explicitly assumes `b ∈ 𝒳(O_K)`. Several nodes
   used integral tangent vectors without a supplier: Kim's dimension conjecture
   (optionally), BDCKW's conjecture, and the thrice-punctured line over Z, which
   has no integral point at all. This is now a recorded gap naming the missing
   inputs: the tangential fibre functor (Deligne §15), its Galois action, the
   twisting comparison (BDCKW §2.9) and the iterated-integral coordinates. The
   gap is needed by `kim-dimension-conjecture`, `kim-conjecture` and
   `thrice-punctured-depth-one`.
   - `cm-rank-one-finiteness` and `genus-zero-dimension` now use an integral
     (S-integral) base point. This follows Kim 2005, p.17, which takes an
     S-integral base point when one exists; otherwise there is nothing to prove.
   - `kim-dimension-conjecture` gained the proof step that moves from a
     tangential to an integral base point.
2. **Period coordinates of the thrice-punctured line.**
   `thrice-punctured-depth-one` cited `NC.4/depth-one-period`, which is stated
   for proper curves and explicitly excludes open ones. It now cites:
   - `NC.4/iterated-coordinates`, at the tangential base point, which rests on
     the gap above;
   - `ColemanIntegration:L1/punctured-line-coleman-functions`, for the
     regularised integrals log z, log(1 − z) and Li₂;
   - `ColemanIntegration:L2/inversion-relation`, for Li₂(ζ⁻¹) = −Li₂(ζ).

   ColemanIntegration is tier 15, below this roadmap's tier 16.
3. **Gysin sequence of a punctured curve (new request).** No node supplies the
   Galois-equivariant sequence 0 → H¹(X̄′) → H¹(X̄) → (boundary twist of
   Q_p(−1)) → 0. Four nodes use it: `h2-growth-bound`,
   `vanishing-implies-dimension`, `weight-splitting-implies-vanishing` and
   `weak-jannsen-implies-dimension`. A precise request to
   `EtaleDualityAndPerverseSheaves:EDC.3` (Gysin maps and purity) is added.
   The Künneth request to EDC.0 is widened to cover Weil restrictions, which
   the weak-Jannsen argument needs when it passes to the field of the cusps.
4. **Kim's Observation 4.** Kim derives finite generation of I over Z_p from
   pseudo-nullity. That is false in general: over Λ ≅ Z_p[[T₁, T₂]], the
   module Λ/(p, T₁) is pseudo-null and is not finitely generated over Z_p. The
   weight argument needs only that I ⊗ Q_p is finite-dimensional, which
   follows from pseudo-nullity by a dimension count and Nakayama's lemma. The
   node now uses that statement, recorded as new finding
   E-NC6-kim-pseudonull-fg, so the gap "Greenberg 1978 not read" is retired.
   Three further additions to the node:
   - p odd, so that Λ is a domain, as the cited definition of pseudo-null
     modules requires;
   - finite generation of I over Λ, made explicit in the hypothesis;
   - the vanishing of H^j(G_∞, H¹^{⊗n}(1)) ⊗ Q, through central homotheties
     acting by u^{2−n}, which Kim's Hochschild–Serre identification uses
     silently.
5. **`h2-growth-bound`.**
   - Right exactness of H² now cites the rational-coefficient form of
     ArithmeticGaloisDuality R02.4, so p = 2 is covered (Kim allows any prime
     of good reduction over Q).
   - The open-curve local bound goes through the Gysin request.
   - The Hodge–Tate weights are restated in R06.2's convention HT(χ) = +1;
     they had been given with the opposite sign.
   - The source note no longer cites the rejected notation finding.
6. **`vanishing-implies-dimension`.** Added a proof step for the trace τ_k of
   complex conjugation and the prerequisite `QM.6/free-lie-algebra-character-formula`,
   whose character formula for an automorphism is what gives τ_k. The boundary
   trace 1 − r (r real boundary points) and the compact trace 0 give t = −m
   exactly for genus 0 with all boundary points real; I rederived this
   independently.
7. **`weak-jannsen-implies-dimension`.** Three proof steps added:
   - the transfer of the hypothesis to the field F′ of the cusps (Shapiro's
     lemma and Weil restriction; F′/Q is unramified outside T);
   - the genus-zero case, where Kim's base a = ((2g)^{2k} − 1)^{1/(2k)} is
     undefined;
   - the Gysin sequence, as the source of the H₁ exact sequence.
8. **`section-map-injective`.** Dropped the sentence about finite extensions of
   Q_p, which no planned node supports. Stix's compactness remark (Remark 46)
   is not planned anywhere, and the theorem's general divisibility hypothesis
   already covers that case. The locator now notes the proof on p.23.
9. **Unit test.** `selmerVanishing_not_bloch_kato_selmer` could not catch a
   wrong definition: it argued at n = 1, while the proposition concerns n ≫ 0,
   and the Bloch–Kato variant is stronger, not weaker. It is replaced by
   `selmerVanishing_needs_local_conditions`. For P¹ ∖ {0, 1, ∞} and even n,
   the unrestricted H¹(G_T, Q_p(1 − n)) is nonzero by the Euler characteristic
   formula, while the strict group vanishes. The suggested file gains its
   dimension-sequence form.
10. **Locators.** Linton–Nyberg-Brodda's equation (32) is in §1.7.6 on p.62,
    not p.65. It is fixed in the node, the gap, `sources` and `sourceVersions`.
    `section-classes` gains Stix Appendix A, Propositions 42–43, pp.21–22, for
    the bijection with nonabelian H¹.
11. **Bookkeeping.**
    - Removed E-NC6-tail-truncation and E-NC6-phi-branch. They concern BDMTV,
      which no NC.6 node uses, and duplicate EffectiveDiophantineMethods/E21
      and E30, which are confirmed in that packet. Kept here, the first would
      also have been listed in the errata register as "already corrected in
      print", which it is not.
    - Removed the four sources no node or finding cites: Mochizuki 1996,
      Balakrishnan–Dogra, and BDMTV v4 and published.
    - Updated the summary and coverage.
12. **Restructure proposal.**
    - I confirmed that no node uses NC.1 or NC.5, so the proposal now asks to
      remove both stage edges.
    - The NC.2 → NC.6 and NC.3 → NC.6 links are added, next to the NC.0 and
      NC.4 links already proposed.

## Sources and findings

I re-downloaded the five sources the nodes cite and matched every SHA-256
receipt in the packet:
- Kim, Publ. RIMS 45 (2009), publisher PDF;
- BDCKW, arXiv:1209.0640v4;
- Stix, arXiv:0809.0017v1;
- Kim, arXiv:math/0409456v1;
- Linton–Nyberg-Brodda, arXiv:2501.18306v1.

I read every locator. Kim 2009 pp.124–126 were checked as rendered page
images, because a text extraction loses subscripts. Printed page numbers equal
PDF page numbers in the arXiv files, and the Kim 2009 pages are those of the
journal.

| Finding | Verdict and check |
| --- | --- |
| E-NC6-kim-conjugation-eigenspaces | Confirmed. Kim's d_n/2 on p.123 holds only in pure odd weight. The thrice-punctured line gives d_n for odd n, and the corrected trace count keeps Proposition 2. |
| E-NC6-kim-h1-notation | **Rejected.** The published pp.124–126 print the homology H₁ with a subscript in the Lemma 6 surjection and injection and in Observation 3's exact sequence. H¹ appears only where cohomology is meant. |
| E-NC6-kim-purity-open | Confirmed (p.122). For affine X the weights of V_n lie in [n − 2, 2n − 2]; the splitting argument survives. |
| E-NC6-kim-rank-one | Confirmed (pp.127, 129). Selmer rank one needs finiteness of Ш(E)[p^∞] in addition to rank one. |
| E-NC6-bdckw-prime-list | Confirmed (§1.16 p.8 against §8.2 p.49). |
| E-NC6-bdckw-congruence-or | Confirmed (§7.6 p.48). |
| E-NC6-bdckw-selmer-index | Confirmed (§6.2 p.44). |
| E-NC6-stix-theorem-reference | Confirmed (Remark 46 p.22). Stix's paper has no lettered theorem. |
| E-NC6-kim2005-soule-range | Confirmed (p.18). |
| E-NC6-kim-pseudonull-fg (new) | Error, affects the proof (p.131). Counterexample and corrected step as in correction 4. |
| E-NC6-kim-cd2-p2 (new) | Error, affects nothing (p.124). cd₂(G_T) is infinite over Q; H² stays right exact with Q_p-coefficients. |
| E-NC6-kim-lemma6-open (new) | Error, affects nothing (p.124). Two of Kim's claims fail for affine curves: that W₀ ≅ Gr₂(−1), and that dim Gr₂ ≤ g. The displayed bound and P(n)gⁿ survive. |

Every other node statement matches its source. I recomputed every test and
acceptance check:
- Witt values 2, 1, 2, 3, 6; Labute values 4, 5, 16; the genus-one case;
- dim S₁ = 0 < 2 over Z; 2 = 2 then 2 < 3 over Z[1/2]; G_m at every depth;
- E(Q) of y² = x³ − x; the generator (−4, 6) of y² = x³ − 25x;
- the sixth roots of unity mod 7 are 3 and 5;
- 2Li₂(z) + log z log(1 − z) vanishes at 2, −1 and 1/2, by the p-adic
  inversion and distribution relations.

Greenberg 1978 is not freely available and was not read. The corrected
argument no longer needs it.

## Baseline

All seven baseline declarations exist at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, the commit of the shared build.
Each statement provides what its node uses, and none was removed. The packet
cites no Tau Ceti declaration.

| Declaration | Module, line |
| --- | --- |
| `ContinuousMonoidHom` | `Topology/Algebra/ContinuousMonoidHom`, 57 |
| `MulAction.orbitRel.Quotient` | `GroupTheory/GroupAction/Defs`, 349 |
| `AddGroup.FG` | `GroupTheory/Finiteness`, 400 |
| `Function.Bijective` | `Logic/Function/Defs`, 163 |
| `ArithmeticFunction.moebius` | `NumberTheory/ArithmeticFunction/Moebius`, 51 |
| `Nat.divisors` | `NumberTheory/Divisors`, 52 |
| `Filter.Eventually` | `Order/Filter/Defs`, 281 |

## Suppliers, tiers and ownership

I read the statement of every cross-roadmap prerequisite: 52 nodes and the
three requested stages. All supply what their consumers use, apart from the
cases corrected above. Those were:
- `NC.4/depth-one-period` (proper curves only);
- the local-Albanese and loci nodes of NC.4, for tangential base points;
- `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`, which
  is stated for proper curves and is now combined with the Gysin request;
- the R02.4 cohomological-dimension node at p = 2, which is now used through
  its real-place statement.

The reviewed library audit (AUDIT-08) shows neither the section conjecture nor
any Chabauty–Kim statement in Mathlib or Tau Ceti. Neither does a search of
TauCetiRoadmap main or the current Tau Ceti library, so nothing here
duplicates the libraries.

Three suppliers are nodes of packets whose last review asked for changes:
- `QSeriesPartitionsAndMockModularForms:QM.6/free-lie-algebra-character-formula`;
- `PadicMeasuresIwasawaAlgebras:L4/pseudo-null`;
- `SchemeAndStackFoundations:SF.3/tate-module-etale-h1`.

Their statements as they stand supply what NC.6 uses. If their revisions
change the ids, these citations must follow.

## Suggested Lean file

- `lean-check` gives exit 0 and no errors, with 42 warnings, all of them
  `declaration uses sorry`: 41 before this review plus the new
  `selmerVanishing_needs_local_conditions` example. The build is the shared
  pinned one (Mathlib 082e2d37e8, Tau Ceti f790474).
- The data definitions have real bodies: `GaloisSection`, `SectionClasses`,
  `sectionClassMap`, `wittDim`, `lucasSum`, `labuteDim` and the three
  propositions on sequences. There is no sorry'd data.
- I checked the stated examples by hand: the primitive-sixth-root criterion
  for p = 2, 3, 5 and 7, the divisor-sum identities, and the subsingleton of
  sections of the identity.
- Every packet API and test name appears in the file, either as a declaration
  (dotted names inside their namespace) or in its list of README-only items,
  which now carries the renamed test.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnabelianGeometryAndNonabelianChabauty--NC.6.json`
  (pinned declaration index): 0 errors, 0 warnings.
- `lean-check` on the suggested file: as above.
- `scripts/check_errata.py` is written for standalone errata files. Its id
  rule (`<file>/E…`) fails on every packet, including the accepted NC.5, so it
  is not a packet check. The packet's findings keep the roadmap-prefixed ids
  of section 18.

## Questions and reader synchronization for the orchestrator

The reader document `research/blueprint/readmes/AnabelianGeometryAndNonabelianChabauty--NC.6.md`
is outside #6304's deliverables and was not edited. Before assembly or
packaging, synchronize it from the accepted packet:

- Recorded gaps:
  - remove the Greenberg gap;
  - add the tangential base-point gap;
  - change the Linton–Nyberg-Brodda locator to §1.7.6, p.62.
- Requests: add the EDC.3 Gysin request and widen the EDC.0 Künneth request.
  Dependencies: add ColemanIntegration L1/L2 and EtaleDualityAndPerverseSheaves
  EDC.3, and drop the depth-one-period item from NC.4's list.
- Node texts:
  - `section-map-injective`: remove the p-adic clause;
  - `kim-dimension-conjecture`: add the tangential note and proof step;
  - `selmer-vanishing-conjecture`: the new test;
  - `h2-growth-bound`: p = 2, the Gysin reduction and the HT(χ) = +1 weights;
  - `vanishing-implies-dimension`: the trace step;
  - `weight-splitting-implies-vanishing`: the boundary weight;
  - `weak-jannsen-implies-dimension`: the F′ transfer and genus zero;
  - `cm-rank-one-finiteness` and `genus-zero-dimension`: integral base points,
    and p odd in the latter;
  - `pseudo-null-implies-dimension`: p odd, I finitely generated over Λ, the
    corrected Iwasawa step and the homothety argument;
  - `kim-conjecture`: the tangential hypothesis;
  - `thrice-punctured-depth-one`: the new suppliers;
  - `section-classes`: the Stix Appendix A locator.
- Source corrections:
  - drop the BDMTV sentence;
  - mark E-NC6-kim-h1-notation as rejected;
  - add the three new findings;
  - add the review verdicts.
- Layer acceptance: "closed" now requires the four requested statements, the
  two remaining source gaps and the tangential gap.

For the maintainer:

1. The tangential base-point gap belongs to NC.2–NC.4 of this roadmap. It is
   the main mathematical item left by this layer.
2. NC.6 cites four roadmaps outside the 94 of the Caraiani–Newton order:
   - QSeriesPartitionsAndMockModularForms QM.6 (Witt's formula and its
     character version);
   - PadicHodgeRegulators L1 (H¹_g). CaraianiNewton.md already moves its L1
     down into SelmerIwasawaCohomology; retarget the citation when that lands;
   - MotivicEtaleKTheory M.8 (étale Chern maps);
   - ArithmeticKTheory N.5 (Soulé's computation).

   The order file should record them for this tier-16 roadmap.
3. Restructure: narrow NC.6 as proposed. Remove the stage edges NC.1 → NC.6 and
   NC.5 → NC.6, and add NC.0, NC.2, NC.3 and NC.4 → NC.6.
4. The two removed BDMTV findings stay recorded, and confirmed, as
   EffectiveDiophantineMethods/E21 and E30.
