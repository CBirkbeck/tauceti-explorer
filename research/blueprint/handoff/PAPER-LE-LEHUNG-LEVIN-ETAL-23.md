# LLHLM23 — current handoff: nonzero characteristic-p formal fibres

Codex — codex-rtOQ9t; issue #1254; claim confirmation 5910921748;
30 September 2026. **Partial checkpoint:** 847 items (156 library, 48 planned,
643 missing), 27 routes, 124 unreviewed source findings and 11 gaps.
This session is ineligible to review or red-team this extraction.

## Completed here

- L152 imports the actual Artinian nilradical-power quotient product and
  nilpotence statements. L153 imports finite-product tensor algebra equivalence.
- Z171–Z174 give the canonical nonreduced Artinian localization product,
  fixed-index quotient diagrams, their compatible inverse limits and full
  finite-algebra completion product07N9. L112's linear equivalence is upgraded
  by its canonical multiplicative formula, not by assuming a new algebra API.
- Z175–Z176 construct a finite order inside any finite fraction-field extension
  and prove its complete-locality using the product theorem and the domain
  hypothesis. An arbitrary finite algebra is not claimed local.
- Z177 supplies the ambient generic COEFFICIENT fibre over a power-series
  base. Extend the detecting derivation coefficientwise to B[x], then localize
  and complete; x is retained. This does not substitute Z170's generic
  polynomial fibre or assume the nonzero-prime result in a circle.
- Z178 isolates equal-characteristic finite Cohen normalization. Its exact
  theorem and outer proof are recorded, with deeper suppliers still open.
  Z179 uses it and the product comparison for the general ambient ring.
- Z180–Z182 identify the final x−f quotient and every finite scalar-extension
  test. A factor for which r′ is not contained in q_i is zero; supported
  factors use the linear-prime argument. Z79 now imports Z182.
- E124 records the wrong base-change citation in07PM:15.38.8/07EG is intended,
  whereas15.38.9/07EH is descent. The finding awaits independent review.

## Resume here

1. Continue **Z178/032D Case I**: coefficient-field existence032A; parameter
   ideals; cofinal adic completeness; finite generation from the residue
   quotient10.96.12; injectivity via dimension10.112.3. The outer032A/032D
   proofs were freshly read; their deeper suppliers remain to decompose.
2. Keep arbitrary residue fields. The pinned Mathlib instance
   `Algebra.FormallySmooth.of_perfectField` requires `EssFiniteType`; do not
   silently drop it. Its more general separating-transcendence-basis result
   was also read but is not a proof for every residue field without that data.
3. The mixed-characteristic032D branch, full finite-type reduction of07PH and
   extra transcendental-field formulation of0381 remain open. This checkpoint
   does not prove the general formal-smoothness/regularity equivalence07PM;
   Z177 gives the narrower ambient proof actually used by07PU.
4. Retain all other analytic/homological, definition-API, owner, global and
   source gaps, E60/Z99's characteristic-zero repair, scalar prime/Hodge bounds
   and Appendix B certificates. The fourteen additions are not global closure.

Z171–Z176 refine R03.1; Z177–Z182 refine existing SF.0/SF.4. No new route.
All 833 inherited item statements/statuses/locators, 123 earlier source
findings and old sourceData are preserved. All 643 missing items are routed
once; 1,875 internal edges are acyclic. Paper/intake, preservation, finite
arithmetic examples and whitespace checks pass. No Lean deliverable or
compilation. The report/result retain all required provenance and proof/API
boundaries; no scratch file is needed to resume.

---

# LLHLM23 — current handoff: characteristic-p generic formal fibres

Codex — codex-a71f92; issue #1254; claim confirmation 5910256576;
30 September 2026. **Partial checkpoint:** 833 items (154 library, 48 planned,
631 missing), 27 routes, 123 unreviewed source findings and 11 gaps.
This session is ineligible to review or red-team this extraction.

## Completed here

- L147–L151 are exact pinned imports: coefficientwise polynomial derivation,
  the Kähler universal property, a power of a finitely generated radical,
  contraction of maximal ideals under integral maps, and separable polynomial
  contraction. Existing finite completion L112 is reused.
- Z152–Z160 supply p-basis APIs, finite coefficient subrings, the directed
  intersection after finite field extension and a detecting derivation on a
  finite order. The relative differentiation kernel is kK^p, not always K^p.
- Z161–Z167 supply derivation localization, the inseparable hypersurface test,
  Frobenius-bounded orders, the unique-prime completion comparison, the regular
  power-series base and the purely inseparable generic-fibre induction.
  Deliberately chosen orders avoid a new normality theorem. Rescale a root
  z by b to put f=a/b into the integral equation (bz)^p=a b^(p−1).
- Z168–Z170 prove every finite scalar-extension test by a coefficient-root
  field square, existing finite-separable regularity and faithful-flat descent.
  Z79 now imports Z170. This source-level generic-prime branch is no longer
  wholly unread; no Lean implementation or recursive global closure is claimed.
- E121–E123 record current Stacks proof/notation defects at07P2,07P4,07P5.
  E122 requires a cofinal restriction before a direct sum, with the family
  {F_p(t),F_p(t^p)} as a boundary example. All intended results survive.
  These findings await independent review.

Z164 stays at existing R03.1, Z166 at R03.3; the remaining new source items
refine the existing SF.0/SF.4 direction. There is no new route or roadmap.

## Resume here

1. Continue the analytic-regularity-suppliers gap at **07PU**, the nonzero
   polynomial-prime fibre in Z79. Audit the finite complete-local order in the
   extended residue field and its locality, then the formal-smoothness inputs
   Stacks15.38.2/15.38.4 and15.50.2. The final fibre is a quotient by x−f.
2. **07N9:** Z164 supplies only the unique-prime specialization. Decompose the
   full product over primes, Artinian finite quotients and the compatible
   inverse-limit product map. The existing finite-product linear completion
   equivalence is not by itself this algebra comparison.
3. **032D:** separate coefficient-field/Cohen-ring existence, systems of
   parameters, equivalent adic completeness, finite generation from the
   residue quotient and injectivity from dimension. Preserve ownership.
4. Z160 supplies exactly the finite-order case of07PH needed by07PR. Its
   arbitrary finite-type reduction still imports Cohen normalization and
   birational denominator rescaling. Z169 supplies finite field tests, not
   the entire transcendental-field/smooth-model formulation of0381.
5. Preserve E60/Z99's characteristic-zero repair, the scalar prime/Hodge bounds,
   Appendix B certificates and the remaining global/source/API/owner gaps.

All 809 previous item IDs/statuses/statements/locators, 120 previous findings
and pre-existing sourceData are preserved. Every missing item is routed once;
1,827 internal edges are acyclic. Paper/intake/source-version/preservation
checks and 19,319 exact finite diagnostics pass; the diagnostics supplement,
not replace, the proofs. No Lean deliverable or compilation. Source hashes and
proof/API/test contracts are in the result and report; no scratch file is
required to resume.

---

# LLHLM23 — current handoff: scalar bounds and smooth regularity

Codex — codex-J6LwjP; issue #1254; 30 September 2026.
**Partial checkpoint:** 809 items (149 library, 48 planned, 612 missing),
27 routes, 120 unreviewed source findings and 11 gaps.
This session is ineligible to review or red-team this extraction.

## Completed here

- B56 computes the printed scalar BM polynomial and corrected H/Q products
  as powers of 24. B57 computes generic scalar weights for the explicitly
  chosen local family `P_{λ,e}=1`. V17 gives the sufficient global polynomial
  `24`, retains all global hypotheses and separates V09's all-prime local
  result from the supplied odd-prime patching construction.
- The restriction `p ∤ 2n` now appears in P13/B25/B26/B42's extracted
  statements; the old wording is retained as `sourceStatement`. P12/B24
  already retained it. The scalar downstream gap is resolved **at this
  corrected scope**; no dyadic patching theorem or unrestricted interval
  theorem is promised. Historical boundary text and all source findings
  remain available. `sourceData.rankOneScopeResolution` inventories the
  bounds, including the still-restricted entire height intervals.
- L144 imports a standard-smooth neighbourhood; L145 imports Tau Ceti's
  cotangent localization equivalence and scalar/representative formulas;
  L146 imports the cotangent Nakayama criterion. These are exact pinned
  matches, not proposed reconstructions.
- Z148–Z151 refine Z102 through polynomial first-order coordinates,
  independent cotangent classes, rational-point regularity and the flat
  local map `S_q→(κ(q)⊗_k S)_m`. The argument does not require perfection
  or equality of those local dimensions. Z149 stays beside Z103 at R03.3;
  the other three use existing SF.0. No new route was introduced.

## Resume here

1. Continue the `analytic-regularity-suppliers` gap at **Z79**. The Z102
   source-outline frontier has now been replaced by explicit imports and
   adapters. Do not list it as wholly unread or silently call it compiled.
2. For characteristic-p generic fibres, read Stacks **07PR** through its
   deeper suppliers: 15.49.5 (a derivation detecting an element outside
   the pth powers), 15.49.1 (extension through localization and completion),
   15.49.4 (the purely inseparable regularity step), and 10.97.8 (finite
   completion and the product over primes). Preserve the finite normal
   power-series base and purely inseparable tower hypotheses.
3. For the nonzero-prime branch **07PU**, audit the finite complete-local
   order in the field extension, the product of completions, and the
   formal-smoothness inputs 15.38.2/15.38.4 and 15.50.2. The final special
   fibre is the quotient by `x−f`, not a mere localization.
4. For **032D**, separate coefficient-field/Cohen-ring existence, a system
   of parameters, equivalent adic completeness, finite generation from
   the residue quotient, and injectivity from dimension. Check ownership
   and the pinned libraries before assigning any new foundations.
5. The four outer proofs 07PR/07PU/032D/07PV were freshly reread in this
   session to establish this handoff. Their deeper suppliers were not
   closed. Preserve E60/Z99's correction of the characteristic-zero fibre
   sentence in 07PV. Continue the other listed API, library, ownership,
   global and source gaps; this checkpoint is not a complete extraction.

The current report and result record source locators, the published PDF
hash, pinned declaration hashes, proof steps and boundary tests. All 799
inherited IDs/statuses, all 120 findings and Appendix B data are preserved.
All 612 missing items are routed once; 1,775 internal edges are acyclic.
The paper/intake, preservation/routing/cycle and whitespace checks pass;
800 exact scalar product/prime diagnostics pass. No Lean deliverable or
compilation. No scratch file is required to resume.

---

# LLHLM23 — current handoff: scalar diagrams and weight implications

Codex — codex-rtOQ9t; issue 1254; 30 September 2026.
Partial checkpoint: 799 items, 27 routes, 120 unreviewed findings, 12 gaps.
This session is ineligible to review or red-team the extraction.

## Completed here

- N83 computes the predicted and obvious scalar weights directly as the
  same singleton; it stays with the existing modular-representations owner.
- M51 computes C_σ^ζ as the reduced point t_ζ, its lift as G_m^J, and
  the scalar fixed-point theorem with permissible polynomial 1. It retains
  κ−ζ=(p−π)π⁻¹ν and the nilpotent ambient-Grassmannian warning.
- G78 supplies the fixed-component Cartesian torsor square and closed
  étale map, including central-lift compatibility by an explicit Laurent
  gauge. It does not restore the false entire-height-interval hook.
- G79 proves all three scalar weight/component implications at every
  prime, including p=2, with no global patching premise. M51/G78/G79
  stay with the existing monodromy-models extension.
- Eleven consumers have explicit qualified scalar branches: G35–G37,
  G56–G61, M33 and K38. Earlier statements/statuses/findings are preserved.

## Resume here

1. Inventory the remaining numerical bounds in local/global consumers.
   Distinguish proved direct scalar cases from vacuous root-depth claims
   and from actual polynomial exclusions. M51's fixed-point P=1 and
   G28/G29's chart P=1 do not remove B27's global P₄ exclusions of p=2,3.
2. Construct a rank-one dyadic patching functor satisfying every P12/B24
   axiom, or retain p>2 for those global applications. Do not infer a
   global patching construction from the all-prime local comparison.
3. Continue the other eleven gaps, including recursive suppliers,
   definition APIs and absent reviewed library audits. These four
   adapters do not close all their imported suppliers recursively.
4. Preserve E102 and the distinction between a single fixed type, its
   dominance union and the full interval. Congruent central lifts have
   isomorphic étale images via Laurent gauges, not identical lattices.

The report/result contain exact source locators, hash, proofs and tests.
The current bounded readings cover published PDF 37–38, 52–53, 84–85,
91–98, 156–159, 161–162; pages 158 and 162 were inspected as images.
All 605 missing items are routed once; 1,742 internal edges are acyclic.
The 3,120-case exponent diagnostic, preservation, paper/intake and
whitespace checks pass. No Lean deliverable or compilation. No scratch
file is needed to resume.

---

# LLHLM23 — previous handoff: scalar lifting and Serre components

Codex — codex-rtOQ9t; issue 1254; 30 September 2026.
Partial checkpoint: 795 items, 27 routes, 120 unreviewed findings, 12 gaps.
This session is ineligible to review or red-team the extraction.

## Completed here

- Z147 computes the cyclic quotient as G_m×BG_m, retaining the diagonal
  stabilizer, nilpotents and base change; it is routed to existing SF.1.
- K63 computes residual inertia ∏barω_j^{λ_j+μ_j}, with the embedding and
  contravariant sign conventions, and realizes all unramified parameters.
- G76 gives exact fixed-type lifts at every prime, including p=2, without
  global patching. K63/G76 stay with L7.
- G77 identifies the single Serre-labelled component and its smooth reduced
  special fibre, retaining the dual original EG label. It stays with the
  existing monodromy-models extension.
- Scalar continuations of G31/G33/G53/G54/G34/G55 now have these explicit
  suppliers. G28/G29 have direct fixed-chart comparisons with local P=1;
  G30 has the scalar completed-local-ring/domain argument. Statements and
  prior guards are unchanged. All four new adapters have proofs and tests.

## Resume here

1. Read G35/G58 and every arrow of the source diagram (7.17). Determine
   which rank-one conclusions admit a diagram using the single fixed-type
   closed immersion, rather than the false whole-height-interval hook.
   Carry that precise replacement to G37/G60. Preserve E102 and the
   distinction between the dominance union and a full height interval.
2. Establish actual finite bounds in remaining local/global uses. The
   scalar local P=1 argument is specific to the true/naive chart identity;
   it does not remove B27's P₄ exclusions of p=2,3.
3. Construct a rank-one dyadic patching functor satisfying every P12/B24
   axiom, or retain p>2 for those global applications.
4. Continue the other eleven gaps, including recursive suppliers,
   definition APIs and absent reviewed library audits. The four adapters
   do not give recursive closure of all their imported inputs.

Exact source readings, hashes, proofs and diagnostics are in the result and
report. WE19 Proposition 3.1.2 and Corollary 3.2.17 were read including
proofs; K63 supplies the explicit scalar exponent/sign argument. Ordinary
unramified characters are used only with finite-residue complete local
coefficients. Never turn the indeterminate unit of a Laurent polynomial
ring into an ordinary universal continuous character without a topology.

All 601 missing items are routed exactly once; 1,702 internal edges are
acyclic. Paper/intake, preservation and whitespace checks pass. No Lean
file required or compiled. No scratch file is needed to resume.

---

# LLHLM23 — previous handoff: integral scalar fixed-Hodge comparison

Codex — codex-rtOQ9t; issue1254; 30 September 2026.
Partial checkpoint: 791 items, 27 routes, 120 unreviewed findings, 12 gaps.
This session is ineligible to review or red-team the extraction.

## Completed here

- K62 proves finite-DVR lifting with exact λ and τ, including a direct
  coefficient-projectivity argument and the contravariant sign conversion.
- G72 combines K62/K61 with G15/G47 to identify the first projection.
- Z146 supplies weight-zero crystalline ⇒ unramified for unramified K,
  including nonsemisimple representations. Its owner is PadicHodgeTheory:R06.2.
- G73 untwists by a fixed reference character, then uses total ramification
  of K∞/K to prove finite-flat integral extension, including nilpotents and p=2.
- G74 uses finite-flat approximation on smooth charts, then finite-type
  Isom schemes, to establish full faithfulness on the formal coefficient
  category. It does not posit an ordinary universal Galois character over
  O[d,d⁻¹].
- G75 identifies both projections and the integral scalar fixed-Hodge
  Galois–Kisin comparison, using the existing general suppliers. The five
  application adapters stay with L7. The six items have proof outlines and
  three tests each; all earlier statements/statuses/findings are retained.

## Resume here

1. Use G75 with K59/G69–G71 to finish scalar lifting and the component labels
   behind G31/G33/G53. Read each precise target before propagating the
   equivalence. A single fixed Hodge tuple is crucial: preserve E102 and
   the guards on all mixed-height maps and diagrams.
2. Establish actual finite polynomial bounds in the remaining local/global
   arguments. Preserve B27's P₄ exclusions of p=2,3. Empty scalar root depth
   is not a prime bound.
3. Supply the rank-one dyadic patching functor with every P12/B24 axiom,
   or retain p>2. The integral local comparison alone does not construct it.
4. Continue the other eleven gaps, including recursive suppliers and the
   missing reviewed library audits. G75 is a derived adapter with named
   inputs, not a claim that the entire paper has recursive proof closure.

Exact source locators, hashes, coefficient scopes and the proof are in the
result and report. Fresh original Kisin fetches failed with HTTP403. The
existing R07.4 packet explicitly imports the E.4 repair; the current session
read that packet, Conrad's survey and the accessible published supplier
statements. It did not re-read the original Kisin papers. Bartlett's published
Remark2.2.16(2) and Lemma4.1.2 were read at PDF17 and29–30. The latter's
finite-flat approximation is essential to G74; do not replace it by an
argument only on reduced field-valued points.

All 597 missing items are routed once; the recorded graph is acyclic.
Paper/intake validators and whitespace/preservation checks pass. No Lean
deliverable or compilation. Earlier CAS diagnostics are historical evidence.
No scratch file is needed to resume.

---

# LLHLM23 — previous handoff: scalar fixed-Hodge forgetful comparison

Codex — codex-5ebb6f; issue 1254; 30 September 2026.
Partial checkpoint: 785 items, 26 routes, 120 unreviewed findings, 12 gaps.
This session is ineligible to review or red-team the extraction.

## Completed here

- K60 proves Laurent isomorphisms between the same scalar fixed-Hodge
  charts are constant by p-divisibility recursion on every nonzero exponent.
  The coefficient proof permits nilpotents and every p≥2.
- K61 combines this full faithfulness with K21/K27/Z142 to prove the
  fixed-Hodge ε_τ is a closed immersion. Its pullback
  K^{λ,τ}→X^{λ,τ} is consequently a closed immersion.
- K29 and G21/G28/G29/G33 record the fixed-Hodge alternative. Their
  statements, interval guards, statuses and source findings are unchanged.
  The two new items are routed to the existing L7 owner.

## Resume here

1. Prove finite-DVR essential surjectivity of K^{λ,τ}→X^{λ,τ} with
   the exact type and Hodge tuple. Read Caraiani–Levin Proposition5.17
   (published PDF31/printed209) and its Kisin lattice/projectivity and
   period-comparison suppliers. Only the outer proof was read here.
   G15/G47 then identify the first projection; K61 supplies its closed immersion.
2. Separately prove the second-projection comparison with Y^{≤λ,τ},
   including integral G_K extension and uniqueness for coefficient families.
   G02's characteristic-zero extension and field-valued character
   classification alone do not establish this integral equivalence.
3. Specify complete local/finite residue coefficients and the topology if
   using ordinary locally algebraic characters. A universal d over O[d,d⁻¹]
   need not give a continuous ordinary unramified character. Explain the
   formal-stack passage. Conrad AppendixB through B.4(i), printed32–36,
   was read as a potential field-valued input, not a family theorem.
4. After both projections, finish lifting and component labelling behind
   G31/G33/G53 using K59/G69–G71. Preserve E102 and every interval guard.
5. Continue finite polynomial bounds and n=1,p=2 patching from the prior
   handoff. K60/K61 do not settle them.

The other eleven gaps and earlier suppliers remain. The graph has 1,641
internal edges and no cycles; all 591 missing items are routed once.
All earlier statements/statuses and 120 findings are preserved. The actual
Python paper/intake validators and whitespace check pass after restoring
execution access. No Lean deliverable or compilation. Earlier diagnostics
are historical evidence. Exact source reading/provenance is in the result;
no retained scratch file is needed to resume.

---

# LLHLM23 — current handoff: scalar monodromy and fixed-Hodge charts

Codex — codex-rtOQ9t; issue 1254; 29 September 2026.
Partial checkpoint: 783 items, 26 routes, 120 unreviewed findings, 12 gaps.
This session is ineligible to review or red-team this extraction.

## Completed here

- G69 gives an explicit scalar monodromy series, with a convergence proof in
  every analytic coefficient chart. It works over the §7.1 O-flat coefficient
  category, including nilpotents, with no height-dependent bound on p.
- G70 proves the true monodromy ideal is zero on scalar monomial families.
  It distinguishes actual zero ideals from equality of reduced loci, and
  characteristic-zero extension from integral Galois comparison.
- K59 computes the fixed-Hodge GL₁ local model as an O-section and its lifted
  chart as a torus, with the cyclic constant torus action. It uses K55 and
  retains K21/K22 as suppliers; the full torus Grassmannian on nonreduced
  rings is not asserted to be discrete.
- G71 identifies the true, truncated and naive monodromy conditions on those
  Kisin charts: all three ideals are zero. Small primes require no factorial
  inversion in this direct calculation.
- G28/G29/G33 and the existing route brief record this progress. No owner,
  source finding or previous item classification was changed.

## Resume at the remaining boundary

1. Supply the **integral rank-one fixed-Hodge Galois comparison**
   X^{λ,τ}≅Y^{≤λ,τ}, for precisely defined coefficient families. A possible
   route is local class field theory and locally algebraic characters:
   classify fixed Hodge/type characters as a fixed character times an
   unramified character, and compare the integral flat closures with K59.
   Characteristic-zero points alone do not prove the required integral
   statement. G69–G71 already handle the Kisin monodromy calculation.
2. Use that comparison to finish scalar lifting, component equality and
   component labelling behind G31/G33/G53. Preserve the separate height
   interval issue: E102 still disproves the unrestricted hook in (7.17).
   Do not remove G18's interval guard on the strength of G71.
3. Determine bounds required by the remaining Galois/global arguments before
   absorbing them into an existential polynomial B!·P. Retain B27's factors,
   including P₄ and its exclusions of p=2,3. No new scalar analytic precision
   threshold is needed for the specific charts proved here.
4. Supply the n=1,p=2 patching functor with all P12/B24 axioms or retain p>2.
   The scalar monodromy result does not supply this global construction.

The other eleven gaps and the external suppliers below remain. Every
non-library theorem has an outline, but this is not recursive proof closure.
All four new adapters have three tests and explicit ownership. The internal
graph is acyclic with 1,633 edges, and all 589 missing items are routed once.
The paper, intake and whitespace checks pass; exact finite-series checks cover
24 cyclic families through degree 35 over Q[ε]/(ε²). No Lean was compiled.
The result records source hashes, exact selected reading and pinned searches.
No retained scratch file is needed to resume.

---

# Previous handoff: rank-one downstream scope

Codex — codex-rtOQ9t; issue 1254; 29 September 2026.
Partial checkpoint: 779 items, 26 routes, 120 unreviewed findings, 12 gaps.
This session is ineligible to review or red-team this extraction.

## Completed here

- Corrected P17's statement to require n≥2, agreeing with its existing proof.
- Retained p ∤ 2n in B24's application of P12. E88 now records an actual
  downstream proof gap, with B25/B26/B42 carrying the existence boundary.
- Extended E102 to the final bounded-height hook in diagram (7.17), checked
  on an enlarged published page image and in arXiv v2. Scalar Frobenius
  matrices 1 and v^(p−1) give the explicit collision at h=p−1.
- G35 now has conservative corrected scope n≥2; its original source statement
  and rank-one target are retained. The fixed-Hodge component equality is
  distinguished from the false unrestricted interval hook.
- G17's comparison API now agrees with G18's prime guard. G28–G31,
  G33–G35, G37, G53–G54 and G58–G61 have explicit rank-one proof boundaries.
- G30 uses K58 for the scalar semisimplicity step. B27/V08 record why a
  P₄ factor excludes p=2,3 even though scalar root depth is vacuous.
- Both existing route briefs retain the new obligations; ownership is unchanged.

## Exact continuation for this gap

1. Prove the scalar fixed-Hodge/true-monodromy comparison in families,
   separately from uniqueness over a whole height interval. Fix the convention
   for h_λ when the root set is empty; do not silently infer a prime bound from
   it. Start with G28's G11/U24 inputs and the gauge contraction K55.
2. Supply the scalar lifting and shape comparison behind G31/G53, then finish
   the component equality and labelling. A rank-one flag is unique, but that
   does not make the interval hook injective.
3. Determine actual finite prime/precision bounds for those proofs. Only then
   absorb them into the existential polynomials by B!·P. Keep B27's existing
   positive shifts and local-model factors. Its P_m factor must not be replaced
   by a vacuous depth condition.
4. Supply the n=1,p=2 patching functor with every P12/B24 axiom or retain p>2.
   Do not confuse representation dimension n=1 with generic module rank one.

The other eleven gaps and external suppliers listed below remain. This
continuation does not reattribute the inherited full-paper reading, claim
recursive closure, or certify any Lean implementation. The three file checks
pass; the graph has 1,604 internal edges, no cycles, and one route per missing
item. The source hashes and selected fresh-reading pages are in the result;
no retained scratch file is required to resume.

---

# Previous handoff (cc-58621d, A-outline step)

Claude Code — cc-58621d; issue 1254; 29 September 2026 (A-outline step).
**Partial checkpoint, continuing the checkpoints below.** Census: 779 items, 26 routes, 120 findings
(E119 and E120 are new), 12 gaps. No Lean deliverable or compilation. This session has edited the
result file and is ineligible to review or red-team it.

## Completed here

- **The A queue is done.** The 56 Appendix A theorem items without an outline now carry
  `proofSteps`, `prerequisites` and `proofProvenance`. They were read from Appendix A (PDF187–201) and
  the sources it cites, with the recorded findings applied: Thorne, CHT, Bellaïche–Chenevier, BLGGT,
  Labesse, Mœglin–Waldspurger and EGH. There are 32 new internal edges, and the graph stays acyclic
  at 1,600 edges. Every theorem item outside the library-cited L list now has proof steps.
- **E119.** A misprint in the published CHT, in the proof of Lemma 2.1.9: a direct-limit arrow where
  the inverse limit is meant.
- **E120.** §A.4 asserts that pr S(U₁(Q), W)_{m_Q} is free over O[Δ_Q]. The proof it follows,
  Thorne's Theorem 6.8(ii), omits that pr S is a direct summand; A33 supplies the step.
- **Records corrected:**
  - E49–E51's page range for BLGGT l = p II, now 165–179;
  - three more rank slips in E50;
  - A81's locator, now §1.8.2.

## Resume from here

1. **The remaining gaps**, as listed in the Q03 step below.
2. **External inputs.** The items import these theorems rather than prove them:
   - B20, B31 and B32 (§8), and §7's imports: Kisin [48], [49]; Emerton–Gee [22]; [56, Proposition
     3.1.2];
   - Appendix A's imports:
     - Thorne's Proposition 4.4 and §5;
     - CHT's Proposition 3.4.4 and Corollary 2.3.5;
     - Bellaïche–Chenevier's Theorem 1.2;
     - BLGGT's Theorem 1.1 (l = p, II) and Theorem 2.1.1 (Annals 179);
     - Labesse's Corollary 5.3, Mœglin–Waldspurger's main theorem and EGH's Theorem 7.2.1.
3. Construction and definition items were not in the queues. Across the paper 78 constructions and 89
   definitions have no steps, including 18 and 6 in Appendix A.

---

# Previous checkpoint (cc-58621d, G-outline step)

Claude Code — cc-58621d; issue 1254; 29 September 2026 (G-outline step).
**Partial checkpoint, continuing the checkpoints below.** Census: 779 items, 26 routes, 118 findings,
12 gaps. No Lean deliverable or compilation. This session has edited the result file and is
ineligible to review or red-team it.

## Completed here

- **The G queue is done.** The 39 §7 theorem items without an outline now carry `proofSteps`,
  `prerequisites` and `proofProvenance`, read from the published PDF132–162 with the recorded §7
  findings applied. There are 127 new internal edges, and the graph stays acyclic at 1,568 edges.
- §7 was re-read in full; no new finding.
- Two implicit steps are recorded in the steps:
  - Theorem 7.3.2(2)'s polynomial condition on μ, which must absorb the choice of presentation
    (Lemma 7.3.1);
  - Remark 7.4.3(2)'s use of h ≥ n − 1.

## Resume from here

1. **The last no-outline queue:** the A (56) theorem items without `proofSteps` (Appendix A and its
   global inputs: Thorne, CHT, Labesse and the base-change suppliers). The L items (138) are library
   citations.
2. **The remaining gaps**, as listed in the Q03 step below.
3. **External inputs** noted in the B step (B20, B31, B32), plus §7's imports: Kisin [48], [49];
   Emerton–Gee [22] Theorems 4.8.12 and 4.8.14 and Proposition 4.8.10; and [56, Proposition 3.1.2].

---

# Previous checkpoint (cc-58621d, B-outline step)

Claude Code — cc-58621d; issue 1254; 29 September 2026 (B-outline step).
**Partial checkpoint, continuing the checkpoints below.** Census: 779 items, 26 routes, 118 findings
(E117 and E118 are new), 12 gaps. No Lean deliverable or compilation. This session has edited the
result file and is ineligible to review or red-team it.

## Completed here

- **The B queue is done.** The 28 §8 theorem items without an outline now carry `proofSteps`,
  `prerequisites` and `proofProvenance`. They were read from the published PDF163–180, with E21, E41
  and E75–E83 applied. There are 147 new internal edges, and the graph stays acyclic at 1,441 edges.
- **E117.** The last paragraph of the proof of Corollary 8.5.2 applies Lemma 8.5.1 at points of P_ss,
  which do not satisfy its hypothesis. The repair works at ρ̄^ss through the patching functor's
  support axiom. B31's steps use it.
- **E118.** Lemma 8.4.9 cites Remark 7.4.3(3), whose depth condition S_{Λ,t} does not give when
  h_{λ+η} > 6n−4. The first sentence follows from the second by semisimplification. B40's steps use
  this.
- Both findings were checked against arXiv v2 and Crossref.

## Resume from here

1. **The remaining no-outline queues:** the A (56) and G (39) theorem items without `proofSteps`. The
   L items (138) are library citations.
2. **The remaining gaps**, as listed in the Q03 step below.
3. **External inputs.** B20 ([56, Corollary 4.2.4]), B31 (the strengthening of [29, Proposition 7])
   and B32 ([56, Theorem 3.4.1]) rest on cited proofs that the paper does not reproduce. They belong
   with the other supplier boundaries.

---

# Previous checkpoint (cc-58621d, K/P/Z-outline step)

Claude Code — cc-58621d; issue 1254; 29 September 2026 (K/P/Z-outline step).
**Partial checkpoint, continuing the checkpoints below.** Census: 779 items, 26 routes, 116 findings,
12 gaps. No Lean deliverable or compilation. This session has edited the result file and is
ineligible to review or red-team it.

## Completed here

- K45–K48, P17 and Z01 now carry `proofSteps`, `prerequisites` and `proofProvenance`. There are four
  new internal edges, and the graph stays acyclic at 1,294 edges.
- K45 has a direct proof from (2.12); K47 descends semisimplicity by the Jacobson radical.
- Z01 is outlined from its source's main text only; Appendix B was not read in detail.

## Resume from here

1. **The remaining no-outline queues:** A (56), G (39) and B (28) theorem items without `proofSteps`.
2. **The remaining gaps**, as listed in the Q03 step below.

---

# Previous checkpoint (cc-58621d, U-outline step)

Claude Code — cc-58621d; issue 1254; 29 September 2026 (U-outline step).
**Partial checkpoint, continuing the checkpoints below.** Census: 779 items, 26 routes, 116 findings,
12 gaps. No Lean deliverable or compilation. This session has edited the result file and is
ineligible to review or red-team it.

## Completed here

- **The U queue of the no-outline families is done.** The 26 §3 theorem items (U05–U45) now carry
  source-level `proofSteps`, `prerequisites` (60 new internal edges; the graph stays acyclic at
  1,290 edges) and `proofProvenance`. They were read from the published PDF55–80 with E7–E12 applied.
- §3 was re-read in full; no new finding.

## Resume from here

1. **The other no-outline queues.** These theorem items have no `proofSteps`: A (56), G (39), B (28),
   K (4), P (1) and Z (1). The L items (138) are library citations and need none.
2. **The remaining gaps**, as listed in the Q03 step below: rank-one downstream boundaries,
   Section 2 suppliers, regularity and analytic suppliers, closure-external inputs, global descent
   atoms and the auxiliary projector input.

---

# Previous checkpoint (cc-58621d, Q03 step)

Claude Code — cc-58621d; issue 1254; 29 September 2026 (Q03 step).
**Partial checkpoint, continuing the checkpoints below.** Census: 779 items, 26 routes,
116 findings (E114–E116 are new), 12 gaps (`appendix-certificates` closed). No Lean deliverable or
compilation. This session has edited the result file and is ineligible to review or red-team it.

## Completed here

- **Q03 (Proposition B.0.1(1)) is settled; this was resume item 1 below.** F1–F3 are the chart's
  equations when the monodromy term of (3.1) is g·Diag(−a, −b, 0)·g^{−1}. The appendix says
  a = (a, b, 0), and (3.1) has + g·Diag(a)·g^{−1}, so the appendix's parameter is the negative of
  (3.1)'s (**E114**). With that sign, the λ-component's elimination ideal equals (F1, F2, F3)
  exactly at five sample points. With the printed sign, none of F1–F3 holds.
- The previous attempt's set-up is the one used here: the chart with c12, the λ-condition, and
  (3.1) mod (v − t)^3 saturated in t. With the parameter Diag(−a, −b, 0) it reproduces F1–F3
  exactly. That note also records an unsuccessful search over signs and orderings, but not in
  enough detail to say why the search missed.
- **The six eliminated coefficients are explicit** (`sourceData.appendixB.q03Resolution.solvedForms`).
  A cofactor certificate shows that they satisfy all 41 chart equations modulo (F1, F2, F3) over
  Z[a, b][1/(aP)]. (F1, F2, F3) is prime over Q(a, b). With Q05's flatness and Proposition 3.3.4,
  this proves B.0.1(1) over Z[1/7!][a, b][1/(aP)].
- **E115.** The formulas for c21 and c31 have the pole a = 0, and at a = 0 the presentation is false:
  E111's point satisfies F1–F3 but is not on the chart for any values of the six coefficients.
- **E116.** The displayed matrix has vc12 for the constant c12; arXiv v2 prints c12.
- The `appendix-certificates` gap is removed. Every Appendix B claim is now certified over
  Z[a, b][1/(aP)] or corrected (E111–E116).
- **Tooling.** Singular via `uv run --with passagemath-singular` worked in this session; each
  computation took seconds. Over a transcendental field Q(a, b), saturating the 13-variable chart
  ideal did not finish in 10 minutes. Work at sample points, or through the rational
  parametrization of V(F1, F2, F3), as in q03Resolution.

## Resume from here

1. **The remaining gaps and the Codex resume items 1–5 below**, which are the non-computational bulk:
   - `rank-one-downstream-boundaries` through §§7.3–9;
   - `section2-source-suppliers` (Jantzen, Deligne–Lusztig, Haines–Ngô, Schneider–Zink, Pyvovarov);
   - the regularity and analytic suppliers (`analytic-regularity-suppliers`,
     `approximation-and-tensor-adapter-closure`);
   - `closure-external-inputs`;
   - `global-descent-supplier-atoms` and `auxiliary-projector-global-input`;
   - the U/G/B/Z/P outline queues.
2. **Optional.** A symbolic recheck of the Q03 cofactor identities outside Singular. Here they were
   rechecked only at 37 random rational points with exact fractions, because a SymPy expansion with
   rational-function coefficients did not finish in 25 minutes. Clearing the denominators
   a(a − 1)^3(a − 2)^2(b − 1)(a − b)^2(a − b − 2)^2 first should make it fast.

---

# Previous checkpoint (cc-e94dc5, Z143 source step)

Claude Code — cc-e94dc5; issue 1254; 29 September 2026 (Z143 source step).
**Partial checkpoint, continuing the checkpoints below.** Census unchanged: 779 items, 26 routes,
113 findings, 13 gaps; one prerequisite added (19). No Lean deliverable or compilation. This session
has edited the result file and is ineligible to review or red-team it.

## Completed here

- **Z143's source is confirmed at the original** (the previous step's resume item 3). Lemma 5.1.2 is
  in Liu, *On lattices in semi-stable representations: a proof of a conjecture of Breuil*, Compositio
  Math. 144 (2008), 61–88, printed pp. 82–83. This is the "[Liu07a]" of the note arXiv:0709.4523v1.
  It is **not** in Liu's 2007 Annales paper, which the previous locator named; that paper only cites
  it (Ann. Sci. ÉNS 40 (2007), p. 658, "Lemma 5.1.2 in [18]").
- The lemma states exactly Z143's three assertions for p ≥ 3: K_{p^∞} ∩ K_∞ = K; the two Galois groups
  H_K and Z_p(1); the semidirect product with H_K acting by the cyclotomic character. Its proof uses
  p > 2 through 1 + pZ_p ≅ Z_p. Remark 5.1.3 gives the p = 2 failure (K = Q_2, π = 2) and the
  survival when Q_2(ζ_4) ⊂ K; the Annales paper's Lemma 8.0.4 extends the p = 2 case to every K
  containing a quadratic subfield of Q_2(ζ_8).
- Z143's locator and note are corrected, both readings are recorded in
  `source.continuationReadings`, the Compositio paper is added to `prerequisites`, and
  `validation.ccE94dc5KummerTowerSource` records the step. No item id, status, route or finding
  changed.

## Resume from here

1. **Q03** is unchanged; see the fourth checkpoint below for the leads (the (1,2) entry is c12; the
   remaining suspects are the monodromy normalization, the identification of a with (a, b, 0), and
   the printed F1–F3). Singular was not available in this session's environment, so no new
   computation was attempted.
2. **The remaining gaps and the Codex resume items 1–5**, as listed below.

---

# Previous checkpoint (cc-39fac3, Kummer-tower step)

Claude Code — cc-39fac3; issue 1254; 29 September 2026 (Kummer-tower step).
**Partial checkpoint, continuing the checkpoints below.** Census: 779 items, 26 routes, 113 findings,
13 gaps. No Lean deliverable or compilation. This session has edited the result file and is
ineligible to review or red-team it.

## Completed here

- The gap `kummer-tower-field-inputs` is resolved and removed.
- New items Z143 (Galois closure; K∞ ∩ K(μ_{p^∞}) = K; G_0 ⋊ H_K with G_0 ≅ Z_p(1)), Z144
  (Gal(K(μ_{p^∞})/K(μ_p)) ≅ Z_p) and Z145 (no degree-p Galois subextension of K∞ without ζ_p), all
  for p > 2.
- Sources: Liu's 2007 note (arXiv:0709.4523v1), EGS 7.4.3 and GLS 5.4.2 (arXiv:1309.0527v2).
- A new source route sends them to `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, and G68
  imports them.

## Resume from here

1. **Q03** (see the previous checkpoint below): the monodromy-condition conventions.
2. **The remaining gaps**, notably `rank-one-downstream-boundaries`, `section2-source-suppliers` and
   the regularity/analytic supplier gaps, together with the Codex resume items below.
3. **Z143's intersection statement** is taken from Liu's recollection of his 2007 Lemma 5.1.2. A future
   reading of that Annales paper should confirm its exact hypotheses.

---

# Previous checkpoint (cc-39fac3, fourth, with Q03 notes)

Claude Code — cc-39fac3; issue 1254; 29 September 2026 (fourth checkpoint).
**Partial checkpoint, continuing the checkpoints below.** Census: 776 items, 25 routes, 113 findings.
No Lean deliverable or compilation. This session has edited the result file and is ineligible to
review or red-team it.

## Completed here

Table 1 (Q09) is certified at every point of V off a·(a(b−1)−b)·((a−b)(a−1)−1) = 0, in every
characteristic > 7. The certificate is containment lifts plus radical membership of the products
of the listed ideals' Gröbner elements (powers ≤ 2), over `Z[1/7!][a,b][1/(P·a·M·L8)]`. Primality,
dimensions and the extra components follow from the explicit forms. The data is in
`sourceData.appendixB.table1Rederivation.uniform`.

## Q03 attempt (cc-39fac3, after the fourth checkpoint): not reproduced; leads for the next worker

I tried to re-derive B.0.1(1)'s three equations with Singular, at (a,b) = (5,−4) over Q. The
setup was:
- the chart matrix of PDF202;
- det A = −(v−t)⁴;
- the λ = (3,1,0) condition, rank A(v=t) ≤ 1, from the 2×2 minors;
- the monodromy condition (3.1) read with L⁺ = R[[v−t]], namely
  (v·A′ + A·Diag(a,b,0))·adj A ≡ 0 mod (v−t)³;
- saturation by t, since M_X(λ,∇) is the closure of the t ≠ 0 open-cell part (Definition 3.3.6).

**This did not reproduce the printed F1–F3**, so none of them is certified.

1. **Entry (1,2).** PDF202 prints the (1,2) entry of A as v·c12. Proposition 3.2.8's own formula
   (PDF60, checked on the page image) gives the constant c12 there, since δ_{1>2} = 0 and the degree
   bound is ν₂ − δ_{1<w(2)} = 1 − 1 = 0 for z̃ = (23)t^(2,1,1). The other eight entries agree with
   the formula.
2. **With v·c12** as printed, the saturated ideal has only 3-dimensional components. The chart over
   fixed (a,b) must be 4-dimensional (flat, with 3-dimensional fibres over the t-line), so these
   conditions over-constrain.
3. **With c12**, there is a 4-dimensional component, and on it five of the six coefficients are
   linear in the other variables. At (5,−4), for example, d11 = c12·d31 − t/6 and
   c23 = (11·c22·d33 − 9t)/7. But c33 only satisfies c33·c12 = t·c13, and the three relations
   among t, c12, c13, d21, c22, d31, d33 differ from the printed F1–F3.
4. **A search over Diag(a) conventions** did not reproduce them either: all orderings and signs of
   (a, b, 0), with A·D or D·A.

**Follow-up from reading §3.1–3.2 (cc-39fac3, later the same day).**
- **The (1,2) entry is c12.** U(z̃)'s definition (PDF59) requires A·(v−t)^(−ν)·w^(−1) to be
  unipotent lower triangular mod 1/(v−t). For z̃ = (23)t^(2,1,1) its (1,3) entry is A12/(v−t), so a
  (1,2) entry v·c12 = (v−t)·c12 + t·c12 would force c12 = 0. Hence the chart has the constant c12,
  as Proposition 3.2.8's formula says, and the printed v·c12 on PDF202 is a display slip. The paper's
  own computation presumably used c12, so it should not be recorded as an error in the equations.
- **The Iwahori condition does not help over X⁰.** L⁺M(R) (PDF56) also asks for upper triangularity
  mod v. But after inverting t, v = (v−t) + t is a unit in R[[v−t]], so this condition is vacuous on
  the saturated ideal and cannot explain the mismatch.
- **The λ condition is not the cause.** With c12, det and the monodromy condition alone, saturated
  in t, the ideal again has exactly one 4-dimensional component. On it, rank A(v=t) ≤ 1 holds
  automatically, and F1–F3 still do not vanish. The same run with the printed v·c12 did not finish
  within 21 minutes.

The remaining suspects are the sign or normalization of the monodromy term, the identification
of a with the Appendix B coordinates (a, b, 0), and the printed F1–F3 themselves.

So either the authors' conventions differ from this reading of (3.1), for example L⁺ in terms of v,
another normalization of A, or a different Schubert condition, or the display has a misprint. Pin
the conventions of §3.1–3.3 down before recording any finding. No finding was recorded, because
which side is wrong is not established.

## Resume from here

1. **Q03 (B.0.1(1)), the last Appendix B item.** Set up the universal matrix A of Proposition 3.2.8
   (PDF202). Impose det A = −(v−t)⁴, the λ = (3,1,0) minor-divisibility conditions (all 2×2 minors
   divisible by v − t), and the monodromy condition (3.1) with a = (a, b, 0): that is,
   (v A′ + A·Diag(a))·adj A ≡ 0 mod (v−t)³ after clearing det A. Then solve c11, d11, c21, c23, c31
   and c33 over `Z[a,b][1/P]` after saturating by t, and certify with Singular as in the previous
   checkpoints. Check the exact form of the conditions on PDF202 and in §3.2–3.3 first.
2. **The Codex resume items 1–5 below**, which remain in force; they are the non-computational
   bulk of the job.

---

# Previous checkpoint (cc-39fac3, third)

Claude Code — cc-39fac3; issue 1254; 29 September 2026 (third checkpoint).
**Partial checkpoint, continuing the checkpoints below.** Census: 776 items, 25 routes, 113 findings.
No Lean deliverable or compilation. This session has edited the result file and is ineligible to
review or red-team it.

## Completed here

1. **Q05 flatness, directly.** The chart's Gröbner basis is monic over `Z[1/7!][a,b][1/P][t]`, so R
   is free over X × V. Every fibre is a complete intersection of dimension 3 and degree 12.
2. **Q04 minimal primes, uniformly.** The seven listed primes are exactly the minimal primes at every
   point of V. The multiplicity is 2 along (c22, c13, c12) and 1 elsewhere, so the chart's special
   fibre is not reduced. The argument is the degree 12 count, together with a unit minor showing
   e ≥ 2.
3. **Q13 reducedness, uniformly.** U^nm_F is reduced at every point of V: the degrees 13 = Σ of the
   seven PDF206 pieces, together with Cohen–Macaulayness.

The data is in `sourceData.appendixB.q04q05Certificate` and `q13Reducedness`.

## Resume from here

1. **Table 1 for every specialization** (B.0.2(3), Q09). Rows 2, 5 and 7 need cells for a(b−1) = b and
   (a−b)(a−1) = 1, and row 4 for a = 0 (E113). The generic rows can be certified like Q04: show
   containment over the base, then run a degree count of Ī + P_k against the Table 1 ideals, using a
   multiplicity bound where needed.
2. **Appendix B is otherwise certified**, except Q06's use of Proposition 3.3.8 and the regularity of
   R[1/t] (Proposition 3.3.4). The remaining work is in the Codex resume items 1–5 below, which remain
   in force.

---

# Previous checkpoint (cc-39fac3, second)

Claude Code — cc-39fac3; issue 1254; 29 September 2026 (second checkpoint).
**Partial checkpoint, continuing the checkpoints below.** Census: 776 items, 25 routes, 113 findings
(E112 and E113 are new). No Lean deliverable or compilation. This session has edited the result file
and is ineligible to review or red-team it.

## Completed here

1. **Q13 Gröbner basis, uniformly (previous resume item 1).**
   - The order is degrevlex.
   - The printed basis is a Gröbner basis in two cells, (a−b)(a−1) ≠ 1 and = 1, with unit leading
     coefficients over `Z[1/7!][a,b][1/(P·L8)]` and over the curve's ring. All 55 S-pairs reduce to
     zero, and membership holds both ways.
   - Both leading-term ideals are Cohen–Macaulay over every field: the integral upper Koszul homology
     over their lcm lattices has no torsion.
   - E112: the printed exception "(a−b)((a−1)−1)" should be "(a−b)(a−1)−1".
   - The data is in `sourceData.appendixB.q13ComprehensiveGroebner`.
2. **Table 1 and the PDF206 components (the generic half of previous resume item 2).**
   - Everything re-derives over Q(a,b).
   - E113: it fails on a = 0 (row 4 and the 7th component split), on a(b−1) = b (rows 2 and 5 lose
     their extra) and on (a−b)(a−1) = 1 (row 7). This is confirmed over Q and F₁₀₁.
   - Consumers are unaffected: Q10 uses only row 4, and a is a unit downstream. Q10's quadric step now
     covers a = 0.
   - The data is in `sourceData.appendixB.table1Rederivation`.

**Tooling.** Singular: `uv run --with passagemath-singular`, then
`from sage.all__sagemath_singular import *`. Use `PolynomialRing(FractionField(QQ['a,b']), …)` for
parameters, `.minimal_associated_primes()`, `.lift()` and `.groebner_basis()`. Every call here took
seconds. For uniformity, divide only by leading coefficients and check that every denominator's
factors are units.

## Resume from here

1. **Reducedness and Table 1 for every specialization.** Both are so far checked at generic points and
   sample points only. A route: comprehensive primary decomposition. Alternatively, generic reducedness
   from the degree identity deg(S/in I) = Σ deg(components), with the components' degrees computed
   uniformly per cell, and the extra loci of E113 as their own cells.
2. **Q04 minimal primes (Proposition B.0.1(2)) over `Z[a,b][1/P]`**, in the same style.
3. **Codex resume items 1–5 below** remain in force.

---

# Previous checkpoint (cc-39fac3, first)

Claude Code — cc-39fac3; issue 1254; 29 September 2026.
**Partial checkpoint, continuing the cc-fb70e5, cc-d67081 and Codex checkpoints below.** Census
unchanged: 776 items, 25 routes, 111 findings. No Lean deliverable or compilation. This session has
edited the result file and is ineligible to review or red-team it.

## Completed here — cc-fb70e5 resume items 1 and 2

1. **Downstream of E111: settled, and E111 does not propagate.** The Appendix B coordinates are
   a = a₁ − a₃ and b = a₂ − a₃ (Remark 3.3.2, PDF62). At the specialization of Theorem 7.3.2,
   `a_τ ≡ s⁻¹(μ+η) mod ϖ` (Lemma 7.3.1, PDF150). So a, b and a − b are ≡ ±⟨μ+η, α∨⟩ for positive
   roots, and they are units whenever μ is m-deep in C₀ with m ≥ 0 (Definition 2.1.10, PDF33).
   - All of P is a unit from 2-depth on.
   - Corollary B.0.5 (5-generic, μ 10-deep) lives in `V_a = Spec Z[a,b][1/(aP)]`.
   - Proposition 3.3.9's proof only uses `t^r ∈ H + J` after base change along g, so it applies over
     X × V_a with r = 3.
2. **Q06 certified over `Z[a,b][1/(aP)]`.**
   - Over Q the denominator ideal is exactly `(H + (F) : t³) ∩ Q[a,b] = (a(a−2)²(a−b)(b−1))`
     (Singular, all twenty minors).
   - Lifting against F1–F3 and the six minors gives
     `2·a·(a−2)²·(a−b)·(b−1)·t³ = Σ h_g·g` with integer cofactors, rechecked in SymPy.
   - It is stored as `sourceData.appendixB.q06CertificateAP`; the old record is marked superseded.
   - `t² ∉ H` over `Q[a,b][1/(aP)]`.

**Tooling note.** Singular runs on this kind of server via `uv run --with passagemath-singular`
(10.8.12; `from sage.all__sagemath_singular import *`). The Q06 Gröbner computations each take under
three seconds. This makes the remaining Appendix B certificates practical.

## Resume from here

1. **Q13's Gröbner basis (proof of Proposition B.0.2(2), PDF205), uniformly.** Show that the eleven
   printed polynomials form a Gröbner basis of the reduced normalization ideal for every field of
   characteristic > 7 and every (a,b) with P ≠ 0, for the order W > c12 > c13 > d21 > c22 > d31 > d33.
   This is a parametric (comprehensive) Gröbner computation. Its steps:
   - membership of each listed polynomial, with cofactors over Z[a,b][1/P];
   - reduction of the seven generators to zero;
   - S-pairs reducing to zero with unit leading coefficients.

   Mind the 8th generator. Its first coefficient is `b((a−b)(a−1)−1)`, which is not a factor of P
   and can vanish on V. The paper's exception "(a−b)((a−1)−1)" (PDF205) should be compared with this
   on the page image before anything is recorded. Then comes the Cohen–Macaulay claim for the monomial
   scheme. Preserve E91.
2. **Q04 minimal primes (B.0.1(2)) and Q09's Table 1 rows, uniformly over V.** Singular's
   `minAssGTZ` or primary decomposition over Q(a,b), then a specialization analysis of the
   denominators, in the same style as the Q06 denominator ideal.
3. **Codex resume items 1–5 below** remain in force as written.

---

# Previous checkpoint (cc-fb70e5)

Claude Code — cc-fb70e5; issue 1254; 29 September 2026.
**Partial checkpoint, continuing the cc-d67081 and Codex checkpoints below.** Census 776 items,
25 routes, 111 findings (E111 is new). No Lean deliverable or compilation. This session has edited
the result file and is ineligible to review or red-team it.

## Completed here — resume item 6, the Q06 half

Q06 is Proposition B.0.1(4): the ideal `H` of 3×3 minors of the Jacobian of the three chart
equations (Q03), taken relative to `Z[t,a,b][1/P]`, contains `t³`. The paper's proof is one sentence
citing Macaulay 2. The three equations were re-read against the page image of PDF202 before any
computation.

- **An exact certificate now exists, with its denominators named.** Buchberger's algorithm with
  cofactor tracking over `Q(a,b)` (SymPy, grevlex, 76 tracked basis elements) writes
  `t³ = Σ h_g·g` with `g` running over `F1, F2, F3` and the six minors
  `M123, M124, M125, M136, M145, M234` (columns in the order c12, c13, d21, c22, d31, d33). The
  identity was checked by exact expansion. Every numerator has integer coefficients, and the lcm of
  the denominators is
  `2·a·(a−2)⁶(a−1)³(a−b)⁶(b−1)⁶(a−b−2)³(a+b−1)⁶·C³` with `C = a³−4a²−ab²+ab+4a+b²`.
  So `t³ ∈ H` over `Z[a,b][1/(aP·(a+b−1)·C)]`. The cofactors are in
  `sourceData.appendixB.q06Certificate`.
- **The exponent 3 is sharp.** `t² ∉ H + (F)` over `Q(a,b)` and at (a,b) = (11,5), (5,−4), (7,−6).
- **The factors a+b−1 and C look like artefacts of the elimination path.** `t³ ∈ H + (F)` holds at
  (5,−4) and (7,−6), both on a+b = 1, and at points of C = 0 over F₁₁, F₁₃ and F₁₇ with P ≠ 0.
  These are sample points, not a proof over those curves.
- **The factor a is not an artefact: E111.** On a = 0, which meets V, the point t = 1,
  c12 = c13 = c22 = d21 = d33 = 1, d31 = (b−1)/(b+1) satisfies all three equations. The six-column
  Jacobian has rank 2 there, so no power of t lies in H and the printed (4) fails. This was checked
  for symbolic b and at b = 5, −3, 7; no power t^k with k ≤ 6 lies in H + (F) at b = 5 or b = −3.
  With the a and b columns included the rank is 3, so `R ⊗ Q` is regular at the witness. The
  regularity step in the proof of (3) is therefore not contradicted by this point; only (4), and
  smoothness of the fibres over V at a = 0, fail.

Q06's statement and proof steps, `validation.appendixChecks`, the `appendix-certificates` gap and
the summary are updated. Q06 stays `missing`: the certificate is a computation recorded in data,
not a formal proof.

## Resume from here

1. **Downstream of E111.** Proposition 3.3.9 and Corollary B.0.5 (Q11) consume r = 3 at a
   specialization `(−p, a, b)`. Check whether the parameters used there can have a = 0, or a ≡ 0 in
   the relevant sense, under 5-genericity and 10-depth. Neither this checkpoint nor the source
   settles this.
2. **A certificate over `Z[a,b][1/(aP)]` alone.** Candidates: rerun the tracked Buchberger with
   other monomial orders or generator subsets. Two certificates whose extra denominators have no
   common zero on `V ∩ {a ≠ 0}` would combine into one over `aP`. The q06Certificate record fixes
   the generator naming to reuse.
3. **Codex resume items 1–5 and the rest of 6** (Q08's uniform Gröbner certificate over
   `Z[a,b][1/P]`, Q09's Table 1 row derivation, preserving E91/Q13) remain in force as written
   below.

---

# Previous checkpoint (cc-d67081)

Claude Code — cc-d67081; issue 1254; confirmed claim 5806326967; 24 September 2026.
**Partial checkpoint, continuing the cc-d67081 and Codex checkpoints below.** Census unchanged at
776 items, 25 routes, 110 findings. One citation corrected, three notes rewritten. No Lean
deliverable or compilation. This session has edited the result file and is ineligible to review or
red-team it.

## Completed here — resume item 7, the fine-ownership half

The preceding checkpoint verified that every library citation *resolves*. This one asks whether each
cited declaration **provides** its item's statement. All 146 library items and their 224 citations
were re-resolved to a file and line at the pins, and each declaration was read together with every
`variable` line in scope at that line, because in Mathlib the hypotheses usually live in the section
variables rather than the declaration.

- **143 of 146 hold as stated.**
- **One real defect, corrected: L75.** It cited `IsGδ.baireSpace_of_t2Space_locallyCompactSpace`
  (LocallyCompactRegular.lean:62), which says a Gδ **subset** is Baire, for an item stating that the
  **space** is Baire. The declaration that provides the item is the instance
  `BaireSpace.of_t2Space_locallyCompactSpace` at line 23 of the same file — the Gδ lemma's own proof
  invokes it at line 64. Replaced. Status unaffected; the fact is in Mathlib under another name.
- **Two stale warnings discharged: L55 and L77.** Both carried notes calling correct citations
  unverified and telling a blueprint author to distrust them. Opened at the pin and all three
  confirmed: `Module.Flat.instTensorProduct` is the anonymous instance at Flat/Basic.lean:232 (with
  Mathlib's own `example ... := inferInstance` at line 242 and the Stability.lean:91 comment naming
  it); `HenselianRing.is_henselian` is the class field at Henselian.lean:96 and
  `IsAdicComplete.henselianRing` the instance at line 170. Absent from the index only because
  anonymous instances and structure fields are not indexed. **Do not re-open these three as
  suspicious, and do not "fix" them.**
- **Planned half: all 48 routings hold**, checked against the full stage text rather than the
  truncated extract. Z23/Z28/Z96 → ModularCurves 4D, which owns "preservation and reflection of
  regularity and dimension under completion of noetherian local rings"; Z49/Z80 → AdicSpaces
  Layer 0, whose 0.5 names Weierstrass division and Noetherianity of `K⟨X₁,…,Xₙ⟩` as milestones.
- **Contract tests Z106/Z111/Z120 are done** — all three carry `api` and `unitTests`. That sub-item
  of resume item 7 is closed.

## Resume from here

Resume items 1 to 6 of the Codex note below are untouched and remain in force. **Resume item 7 is
now closed**: the library citations resolve, they own their statements, the planned routings hold,
and the three named contract tests exist.

What it leaves behind is a measured, named surface rather than an open-ended audit. Of the 174
definition and construction items, 90 carry the api/unitTests contract (9 in the item, 84 through
`definitionApiGroups`) and the following **84 carry `api` with no `unitTests` and belong to no
group**:

N22, N32, N49, N50, U01, U03, U06, U13, U17, U25, U27, U39, M01, M06, M12, M40, M24, M27, M28, K01, K06, K14, K21, K26, K32, P01, P02, P03, G01, G04, G07, G08, G12, G13, G17, G26, G27, G32, B01, B03, B05, B06, B18, B19, B27, B36, V03, V06, V14, V08, V10, A06, A08, A09, A10, A15, A16, A18, A19, A20, A22, A23, Q01, Q07, Z02, L05, Z52, A26, Z66, A34, A35, A46, A60, A66, L70, L71, L80, A90, A94, A95, Z67, N82, L142, Z134

PROTOCOL section 16 imposes no api-or-tests requirement on paper items — that requirement governs
blueprint nodes under sections 3–4 and 12 — so this is this extraction's own convention and neither
the checker nor the protocol will flag it. Treat it as optional polish with a known boundary, not as
a defect, and do not let it displace resume items 1 to 6, which are where the mathematics is.

---


Claude Code — cc-d67081; issue 1254; confirmed claim 5806242520; 24 September 2026. **Partial checkpoint, continuing the Codex checkpoint below.** Census unchanged at 776 items, 25 routes, 110 findings; five library citations corrected. No Lean deliverable or compilation. This session did not author the extraction's mathematics and has touched only the `library` citations of five items; it is nonetheless ineligible to review or red-team the result.

## Completed here — the per-item library audit (resume item 7, library half)

Every `library` and `planned` item was checked against the pinned commits: 146 library items carrying 224 citations over 219 distinct declarations, and 48 planned items.

- **Five citations were wrong and are corrected.** Four dropped the `CategoryTheory.` namespace — L134's `ShortComplex.moduleCat_exact_iff` and `ShortComplex.moduleCat_exact_iff_range_eq_ker`, L135's `ShortComplex.moduleCatHomologyIso` and `ShortComplex.π_moduleCatCyclesIso_hom` — and L141 carried a spurious `Algebra.` prefix on `IsSeparable.of_integral`, which is at Mathlib/FieldTheory/Separable.lean:658. All five now resolve; no statement, status or route changed.
- **Three apparent misses are not errors, and should not be "corrected" by a later worker.** L55's `Module.Flat.instTensorProduct` is an auto-named instance that Mathlib's own Flat/Stability.lean:91 refers to by that name; L77's `IsAdicComplete.henselianRing` is a named instance at RingTheory/Henselian.lean:170; and `HenselianRing.is_henselian` is a structure field, declared at Henselian.lean:96. The declarations index carries none of the three, which is an index limitation, not a citation error.
- **Clean on every other axis.** No cited declaration is private, none is deprecated (two that a mechanical window flags — `Ideal.exists_minimalPrimes_le` and `IsLocalization.AtPrime.ringKrullDim_eq_height` — carry no attribute themselves; the `@[deprecated]` above each belongs to the preceding declaration), no citation is tagged to the wrong library, no `library` item lacks a citation, and all 48 planned items' stage references resolve.
- The weakest name-to-statement overlaps were read rather than trusted: L24 cites `MvPolynomial.pderiv_mul` for the Leibniz rule and L36 cites `Submodule.le_of_le_smul_of_le_jacobson_bot` for Nakayama, both correct despite sharing no vocabulary with the item names.

## Resume from here

Resume items 1 to 6 of the Codex note below are untouched and remain in force. Item 7 is now half done: the library citations are audited and correct, so what remains of it is the **fine ownership** half — whether each cited declaration actually *provides* its item's statement, rather than merely existing — together with the contract tests Z106/Z111/Z120. A mechanical overlap screen is not enough for that half; it produced only naming-style false positives here, and the work needs the statements read at the pin against the item text.

---


Codex — codex-c83e7a; issue1254; confirmed claim5805811150; 24 September2026. **Partial checkpoint.** Current census:776 items,146 library/48 planned/582 missing,25 routes,110 unreviewed source findings,174 definitions/constructions,1,226 acyclic internal edges. No Lean deliverable or compilation. This session authored the extraction and is ineligible to review/red-team it.

## Completed here

- E101 is the corrected K31 statement and nilpotent proof. E102 guards are propagated through K10–K12/K49, K29–K31, the Kisin diagram and direct Section7.2 consumers. K55 supplies unrestricted rank-one scalar contraction, avoiding a false blanket height bound on the gauge arguments.
- K56–K58 give an acyclic semisimplicity repair for E103: unramified repetition; universal-torus projections onto split rank-one lattices; monomial normalization; gauge descent. It adapts **WE19 Theorem3.2.26**, not3.2.20. K43 degenerates over A1 using the whole G_m and applies K58 at0. The actual lattice and Hodge bound are retained. No path from K58 to K41/K43/K44/K47/K48.
- L143 is the exact pinned proper-monomorphism scheme theorem. Z142 is the SF.1/SF.4 algebraic-space/formal adapter; its recursively cited finite étale quotient input remains planned.
- E110 records the rank-one p=2 counterexample to Lemma7.2.10(2). G49 supplies the all-rank digit proof, with p>n from2-depth, and the valid odd-prime rank-one branch.
- G67–G68 supply the finite-length coefficient induction for E65/G50, importing upstream discrete cohomology exactness and transfer. G23/G51/G52/G66 and G18/G21/G24/G25/G62 now have explicit relevant proof steps and bounds. The Kummer-tower field inputs remain a named gap.
- All inherited IDs/statuses and sourceData preserved. Only E65/E101/E102/E103 among inherited findings are refined; no independent verdict added. New item IDs:K55–K58,L143,Z142,G67–G68. New finding:E110. No new routes.

## Resume in depth

1. Follow `rank-one-downstream-boundaries` through Sections7.3–9. The sufficient extracted Section7.2 range is n≥2 or p>h+2. Distinguish actual P_m factorial factors from vacuous GL1 root-depth. Supply scalar proofs or explicit prime assumptions; do not claim all unrestricted main statements follow from these local repairs.
2. Decompose `kummer-tower-field-inputs`: Galois closure K∞(μ_p∞), the Z_p(1) subgroup and conjugation action, and no cyclic degree-p subextension of K∞ when ζ_p is absent. GLS5.4.2 and EGS7.4.3 outer proofs are freshly read. Import field theory from its owner; G67's finite-length diagram chase and upstream ProfiniteCohomology layers5–6 are already identified.
3. Continue no-outline theorem families: **counts** U26,G32,B28,Z1,L137,P1. This is a field census, not a proof-closure claim. Kisin projectivity in G21 still imports Kisin[48] and [2]; G62 still imports the filtered comparison [22,§4.7]. Do not treat explicit outer proof steps as reading every supplier.
4. Preserve the Section2 frontier: E92's exact recurrence stalls (p,n)=(2,5),(2,6),(3,6), Jantzen/DL/Haines–Ngô and SZ/Pyvovarov/depth-zero suppliers. V15 assembly is already explicit through N71 and corrected B28: central c=−η−w0η and P_new=P_old·P_3hη·H_{0,η,e}(X+c). Do not reopen it as an unspecified polynomial.
5. Continue regularity at Z102 standard-smooth/cotangent dimensions, then07PR/07PU, p-basis/formal smoothness and Cohen032D behind Z79. Preserve the DD.1 finite Koszul/minor precursor. Z129 is library; Z130 uses L89/L137.
6. AppendixB: integral t³-in-Jacobian certificate Q06 with denominator locus; uniform Gröbner certificate Q08 over Z[a,b,1/P]; Table1 row derivation Q09. Preserve E91/Q13. Earlier rational generic CAS checks are not uniform integral certificates.
7. Finish contract tests Z106/Z111/Z120 and per-item library/fine ownership audits. Preserve the valid normalized Speh/Whittaker/Galois branch and its A104–A107 analytic suppliers; withdrawn White1106.1127v8 is not a replacement for the read Labesse5.3 branch under F+≠Q.

## Evidence and checks

Fresh main readings:PDF24,99–100,105–125,129,131–132,142–149; main SHA256 e56478796d15c938b864447d4b48d928ee749b95644df15e1e9055bdf9a142dd. Selected WE19, Shapes and shadows, GLS and EGS readings/versions/hashes are recorded in the JSON and report. No fresh full212-page reading is claimed. E110 correction search is bounded and has no arXiv passage comparison or independent verdict.

Paper checker and structural/finite diagnostics pass. Exact finite checks cover the two Laurent counterexamples, scalar Lang products through v^96 (including nonreduced Z/4), and92,864 digit cases. The425-file refreshed input manifest is pinned in validation; all421 original input blobs were unchanged. Three-file intake validation and publication checks are recorded with submission. No formal proof is inferred from these checks.
