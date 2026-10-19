# Independent design review: nonordinary CM special values

**Job:** REV-DESIGN-NonordinaryCMSpecialValues, issue #1729.
**Reviewer:** Claude, session claude-Cm7nRe, 2026-10-19.
**Author reviewed:** Codex, session codex-Aw3zf7, DESIGN-NonordinaryCMSpecialValues (issue #1689, PR #10512).
**Verdict:** accepted after corrections, as a complete target-level planning pass with explicit open obligations. This accepts the specifications and recorded reductions; it does not certify complete proofs or any implementation.

## Scope and counts

The review covered the roadmap definition, all 26 design nodes, the 5 baseline declarations, 15 requests, 6 gaps, 6 source issues, the planets and the suggested Lean file. Every node has a verdict and reason in the packet's `review.checked`.

- **Node verdicts:** 15 verified, 11 corrected, 1 added. None was removed.
- **Inventory now:** 27 nodes (1 definition, 4 constructions, 16 theorems, 5 comparisons, 1 application).
- **API and tests:** 31 API items (1 added) and 21 tests. Every definition and construction keeps at least three tests.
- **Atlas data:** 18 planets (2 removed), 13 requests and 5 gaps.
- **Status:** all implementation statuses remain `unchecked`.

| Layer | Nodes | Planets | Coverage |
| --- | ---: | ---: | --- |
| NCM.0 CM periods and auxiliary characters | 5 | 4 | planned (G5) |
| NCM.1 Normalized elliptic-unit reciprocity | 4 | 2 | planned (G1, G5) |
| NCM.2 Torsion towers and the CM Lubin–Tate comparison | 5 | 4 | planned |
| NCM.3 Root numbers and forced central zeros | 3 | 3 | planned (G7) |
| NCM.4 Finis's inert-prime unit specialization | 5 | 2 | planned (G3) |
| NCM.5 General nonvanishing and coefficient descent | 5 | 3 | planned (G1, G6) |

The layer order follows the dependencies, and every stage target is realised. The roadmap is correctly a Part II of AutomorphicPadicLFunctions, and its title matches that parent.

There is no duplication with the accepted AnticyclotomicLocalUnits and InertAnticyclotomicCMMainConjecture packets:

- AnticyclotomicLocalUnits gap G2 lists exactly the inputs planned here. Its gap G11 is the scalar-to-tensor comparison planned in NCM.5.
- ALU.4 owns ξ_ν and the optimal unit. It also owns the existence of the auxiliary field K (BKO Lemma 3.1), which NCM does not repeat.

A dry atlas assembly adds 24 stages and 58 stage edges with no skipped links. A latent-cycle scan over all packets and roadmap definitions finds no cycle through any NCM stage.

## Sources

All nine recorded sources were downloaded again and matched their recorded SHA-256.

**Read as text:**
- BKO §§2–3, including the page images of pp.951–954 for the placement of the bars in (3.4), (3.6), (3.7), (3.9) and Proposition 3.3.
- Finis §1 (pp.767–770), the opening of §2 (pp.770–773) and Corollary 2.3 (p.778). The proof of Theorem 1.1 and Theorem 4.1 were located at pp.793–795 but not reread.
- Kato 2004 §§15.5–15.9.
- Jia arXiv:2412.05867v1, the whole paper, with page images of pp.4, 10, 18 and 20.
- Rohrlich's PCMI notes, Lecture 1 §3 and Lecture 2 §§4–5.
- Agboola–Howard, author pp.3–4.

**Read on page images:**
- Greenberg 1983, pp.246–247.
- Rubin 1987, p.409.
- Rohrlich 1984, pp.386–388, 391–392, 395–397 and 400–407.

One source was added: Queyrut, *Mém. SMF* 37 (1974), 133–135 (Numdam, SHA-256 recorded), for the local Fröhlich–Queyrut formula. The full Fröhlich–Queyrut paper (Invent. Math. 20, 1973) was not read; the gap G7 says so.

No source passage was copied into the deliverables.

## Corrections made

1. **Auxiliary root number (NCM.3/auxiliary-root-sign).** Away from l, the twist ratio is ν evaluated on f·𝔡_K, the conductor times the different. The step had named only the conductor. Both ideals are conjugation-stable, so the conclusion stands. Finis's proof of Corollary 2.3 (p.778) is now cited for the cancellation of two conjugate split places.
2. **Twisted root number (NCM.3/twisted-root-sign).** The step "the Gauss sum is χ(δ) for a trace-zero δ" is the local Fröhlich–Queyrut theorem, not a routine computation. Greenberg p.247 also takes it from Fröhlich–Queyrut (his reference [7]). No atlas node states it, and the cited AL.1 nodes give only explicit epsilon factors and Gauss sums. It is now a precise request to AutomorphicLFunctionsAndLocalFactors:AL.1, recorded as gap G7 with Queyrut 1974 p.135 as the public source. The parity formula (−1)^c with c=n+1 was checked against BKO p.953, Greenberg p.247 and the inert local computation.
3. **Greenberg locators.** Two nodes cited "Proof of Proposition 8, pp.246–247". Those pages are the root-number computation for Proposition 1 and the discussion of w(Ψρ) on p.247. The locators were corrected.
4. **Counting input (old gap G4 and the DT.2 request).**
   - The second half of Jia's Proposition 5 is Rohrlich 1984 §3, Propositions 1–2 (pp.401–407). That section is self-contained: Ridout's theorem gives the vanishing count, and a covering by squares with a rational-line case gives the q^s bound.
   - Ridout's homogeneous inequality is the n=2 case of the accepted node DT.2/p-adic-subspace-theorem-general-position.
   - The added node NCM.5/rohrlich-lattice-count states the corrected bound and derives it. The DT.2 request and G4 were removed.
5. **Galois stability and coefficient descent (old gap G2 and the CM.4 and AL.5 requests).**
   - **Galois stability.** Jia's step "L(1,χ)=0 implies L(1,χ^σ)=0" comes from Shimura through the weight-two CM newform. NCM.5/central-nonvanishing now imports CZ.5/cm-newform-characterization and ModularSymbolsPadicLFunctions:L4/coefficient-embedding-comparison. The latter transports period-normalized critical values of newforms along coefficient embeddings.
   - **Field of definition.** The field of definition of A_ν=Ω⁻¹L_f(barφν,1) follows from Kato's Proposition 15.9 through NCM.1/elliptic-reciprocity. Apply it at the prime-to-p level f·l^m, where ν is trivial on the p-part, so the ν-weighted sum descends to K(f·l^m), which is unramified above p.
   - **Scalar-to-tensor comparison.** This step needs only an unramified coefficient ring, which NCM.5 proves from p∤h_K.
   - **Consequences.** NCM.0/cm-period no longer imports the GL₂/Q period interface of AL.5. NCM.5/averaged-value-limit is purely analytic. G2 and the CM.4 and AL.5 requests were removed.
6. **Finis supplier (gap G3).** The design read the version of AutomorphicPadicLFunctions:L3h/finis-divisibility from before its review, which lacked D^(1/4) and the b term. The accepted node now states Finis Theorem 1.1(2) exactly. What remains is its prerequisite chain:
   - L3/cm-periods needs good ordinary reduction at the valuation prime.
   - L3h/hida-cm-density needs a p-ordinary CM type.
   - Both are unavailable at an inert valuation prime.

   G3 and the L3h request were narrowed to that point.
7. **Integral zeta class (gap G1).**
   - Kato's (15.6.3)–(15.6.5) and Proposition 15.9 hold in the fraction module or after inverting p. BKO's integral class is therefore a genuine obligation, now also recorded as source issue E7.
   - A route was added. On the component BKO uses (ν-evaluation, Gal(H/K)-augmentation, Δ-invariants), take the principal ideal a=(α) with α≡1 mod 6f·l^m and α≡2 mod p. Then the twisted smoothing factor N(a)−φ(a)σ_a has unit residue α(ᾱ−1).
   - The Betti-lattice comparison remains requested from CZ.0. The CMAllPrimeMainConjectures packet is now reviewed, with verdict needs_changes; G1's text was updated.
8. **Averaged-value family and root-number invariance.**
   - The family is now stated as the characters of Gal(L_P/K), with L_P the union of P-power ring class fields, as in Jia.
   - The missing step W(η^σ)=W(η) was added (Jia (2.13)–(2.18); Rohrlich 1984 §4, p.407).
   - Rohrlich 1984 p.386 is cited for the convention that κ vanishes on the support R.
9. **Smaller items.**
   - The differential rescaling in NCM.1/period-change is now by an element of H× that is a unit at p.
   - Four tests had kind "agreement", which is not a section 12 kind. They now have valid kinds.
   - API item AuxiliaryCharacter.group was added.
   - The planets on the two check nodes, finis-local-corrections and ramified-euler-factors, were removed.
   - The Finis locator citing equations (2.1)–(2.3), which do not exist, now cites p.768, Theorem 1.1(2) and Corollary 2.3.
   - Stage `requires` and the roadmap prerequisites were synchronized with the node prerequisites, and ModularSymbolsPadicLFunctions was added. The NCM.3 and NCM.5 stage descriptions were updated.

## Source issues

| Issue | Verdict | Note |
| --- | --- | --- |
| E1 BKO order/conductor index | confirmed | Same as the confirmed PAPER-BURUNGALE-KOBAYASHI-OTA-21/E2. |
| E2 Jia p.4, χ(nO)=κ(n)n⁻¹ | confirmed | Page image; Rohrlich 1984 p.386 (1) has κ(n)n. |
| E3 Jia §4 congruence without q | confirmed | The locator is corrected: the setting before Proposition 5, not Proposition 4. |
| E4 Jia (4.9) bound q⁻¹ | confirmed | Page image p.20; it should be q^c (Rohrlich p.402). |
| E5 Jia (2.43) positive exponent | confirmed | Page image p.10; Rohrlich p.392 has the minus sign. |
| E6 Jia main term L(1,κ) | confirmed | Rohrlich p.386 defines κ to vanish on R. The factor 6/5 for Q(√−7) at 5 is checked in the suggested file. |
| E7 BKO p.951, integral z_g from Kato 15.9 | added, confirmed | New. Kato's statement is rational; integrality needs the smoothing argument. |
| E8 BKO Proposition 3.3(3), scalar to tensor | added, confirmed | New. It needs an unramified coefficient ring, which the canonical choice has. Affects nothing. |

## Baseline

All five declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:

- `NumberField.RingOfIntegers` (Basic.lean:104);
- `MonoidAlgebra.lift` (MonoidAlgebra/Basic.lean:237);
- `MonoidAlgebra.lift_single` (:256), where evaluation on `single a b` is `b • F a`, with no inverse;
- `Subalgebra.linearDisjoint_iff_injective` (RingTheory/LinearDisjoint.lean:232);
- `DirichletCharacter.LFunction_apply_one_ne_zero` (LSeries/Nonvanishing.lean:408).

Each provides what its citing nodes need. No baseline citation was removed. With `TAUCETI_BASELINE` set to the pinned index, `check_blueprint.py` reports 0 errors and 0 warnings.

## Supplier checks

These supplier nodes were read and supply what is cited:

- **CM.4 and CM.1:** CM.4/canonical-gross-character, gross-curve-good-reduction, frobenius-and-infinity-type and tate-coefficient-components; CM.1/ideal-lattice-curve.
- **CZ.0 and CZ.1:** canonical-cm-pair, elliptic-unit-module, cm-hecke-realization, cm-elliptic-reciprocity and cm-eisenstein-evaluation. Kato's ψ of type (−1,0) is BKO's φ.
- **LT.2 and LT.4:** primitive-division, tate-module-comparison, elliptic-honda-comparison and unramified-honda-comparison. Parameter −p comes from a_(p²)=−2p, consistent with the confirmed BKO erratum E9.
- **SelmerIwasawaCohomology L0:** the three Kummer identifications.
- **PadicHodgeRegulators L1:** dual-exponential.
- **AL.1 and AL.5:** the epsilon, Gauss-sum, functional-equation and Euler-correction nodes.

## Suggested Lean file

The two examples that had `sorry` are now proved from `Subalgebra.linearDisjoint_iff_injective`. Five computed examples were added:

- (2/7)=1 and (2/11)=−1;
- p=5 inert and l=23 split in Q(√−7), with 5∤22;
- the inert Euler factor 1+1/p;
- the factor 6/5 of E6;
- the exponents of Rohrlich's bound.

`lean-check` on the shared pinned build elaborates the file with no errors and no warnings. A deliberately false test file confirmed that lean-check reports errors. `check_sorry_data.py` passes. The file keeps the compact shape: the carriers of the heavy targets are not at the pins, so most packet API items and tests remain README targets.

## Questions for the orchestrator

1. **Reader document.** `research/blueprint/readmes/NonordinaryCMSpecialValues.md` was not among this job's deliverables and was not edited. It still describes G2, G4 and the DT.2, CM.4 and AL.5 requests and the trace-zero step. It also cites "Proposition 8" for Greenberg and lacks NCM.5/rohrlich-lattice-count. It should be regenerated from the reviewed packet before or at promotion.
2. **AnticyclotomicLocalUnits.** Its gap G2 ("unregistered early CM special-value supplier") can now point at NCM.0–NCM.5, and its G11 at NCM.5/unramified-cm-coefficients and scalar-tensor-character-comparison. The CZ.0 request here carries a component-level integrality route that ALU.4/projected-cm-class can also use.
3. **AL.1.** The new request (local Fröhlich–Queyrut) belongs in AutomorphicLFunctionsAndLocalFactors AL.1. It would also serve any other dihedral or anticyclotomic root-number computation in the atlas.
4. **Grouped design #3350.** The restructure proposal (reconciling these six layers with the grouped AutomorphicPadicLFunctionsPartII design) still stands. No roadmap file for that grouped design exists yet.
