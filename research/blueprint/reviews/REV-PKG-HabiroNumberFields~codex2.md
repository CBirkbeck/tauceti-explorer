# Independent package review: HabiroNumberFields, re-check after de-cycling

**Verdict: accepted after the corrections below.** The repointed dilogarithm supplier is accurate and now pinned to its layers. No supplier edge in the README reaches Polylogarithms, the part of K3BlochGroups that consumes this roadmap, or any other later roadmap. Nothing accepted earlier was weakened. One transitive path to Polylogarithms remains inside the PadicHodgeRegulators plan. The README's contract with that supplier now requires its inputs to come before this roadmap, which excludes the path, and the path is flagged for the maintainer below. This verdict concerns the roadmap and its interfaces; it does not assert that any target is proved or formalised.

Reviewer: Claude (Opus 5.5), session `claude-R7S1o1`, 20 October 2026. Issue #11367, job `REV-PKG-HabiroNumberFields~codex2`. The package was written in session `codex-FMv31p` (PR #11049). It was reviewed by `REV-PKG-HabiroNumberFields~adv` in session `codex-gKDVRk` (PR #11119), and the de-cycling fix `FIX-PKG-HabiroNumberFields~adv` was done in session `claude-hA3Fp3` (PR #11361, commit `b3309375b`). I took part in none of these.

## Inputs and scope

The issue template names a Mordell-conjecture title and a `~codex` review report. Neither exists for this package. The actual inputs were the following:

- the package at `b3309375b`;
- the accepted packets `HabiroNumberFields.json` and `--HB.1`, `--HB.2`, `--HB.6`, `--HB.7`;
- the `~adv` review report and the fix handoff;
- the supplier packages of K3BlochGroups, HabiroCyclotomicCompletions, KTheoryFiniteLocalFields, MotivicEtaleKTheory and Polylogarithms;
- the closed PolylogarithmFunctions design (packet and reader);
- the supplier packets of every other cited layer.

As the issue directs, this round checks three things:

1. the repointed PolylogarithmFunctions citation;
2. the absence of supplier edges to Polylogarithms, to K3BlochGroups' downstream material and to later roadmaps;
3. that the fix weakened nothing.

The full adversarial checklist of the earlier review was not rerun.

## Corrections made in the README

1. **PolylogarithmFunctions pinned (scope, contract, §1.3 Needs).** The design packet now exists, with stage ids PF.1–PF.7, though it has no package yet. The citation now names its layers:
   - PF.1, `PolylogarithmFunctions:PF.1/principal` and `PF.1/analytic-recursion`, for the principal Li₂ on ℂ∖[1,∞) and its derivative recursion;
   - PF.3 for Li₂(1)=π²/6 (`PF.3/dilog-values`), for inversion off [0,∞) (`PF.3/inversion`), written in weight two as `Li₂(z)+Li₂(1/z)=−π²/6−½Log(−z)²`, and for Abel's five-term identity on |x|+|y|<1 (`PF.3/abel`).
   I checked the weight-two inversion formula against the packet's Bernoulli form: B₂(1/2+w)=w²−1/12 gives exactly that expression.
2. **The KMS identity is now derived from what PF.3 supplies (§1.3).** PF.3 states the five-term identity only in Abel's form. The identity the KMS product side needs is the eight-term combination that the accepted HB.2 plan specifies near (X,Y)=(1/5,2). It is not an instance of Abel's identity under the principal-valid substitutions alone; a search over all ordered pairs confirmed this. The README now states it as `kms_dilog_identity` and derives it in four steps:
   - inversion at YZ;
   - Abel's identity at x=Z/(Z−1), y=X/(X−YZ). On the hypersurface X−YZ=1−Z, so a=1/Y, b=X and c=X/Y, and |x|+|y|=5/9 at the center;
   - Landen's identity `Li₂(w)+Li₂(w/(w−1))=−½Log(1−w)²` at w=Z and w=X/(YZ);
   - the hypersurface relation (1−Z)/(1−X/(YZ))=−YZ.

   Landen's identity is not a PolylogarithmFunctions target. It is proved here from PF.1: both sides have derivative Log(1−w)/(1−w) on ℂ∖[1,∞) and vanish at 0. I checked each step numerically with an independent quadrature for the principal Li₂. At the center and at two complex points nearby, the residuals were below 10⁻¹⁴ for the full identity, inversion, Abel and both Landen instances. A new Check records the negative control: dropping the logarithmic terms leaves ½(log 8/5)²≈0.1105.
3. **K3BlochGroups downstream material excluded (scope, contract, Downstream consumers).** "Layers V.2–V.6" included K3BlochGroups §6.7, the genuine finite-coefficient comparison. That section uses this roadmap's étale Bloch group, the excluded integer M_F and the comparison R_ζ=c^γ, according to its own README (Exact supplier contracts, §6.7 and Layer 6 Dependencies). Both places now exclude that comparison, and K3BlochGroups is listed as a downstream consumer.

   At node level the V.6 results the plan uses do not depend on HabiroNumberFields. These are `comparison-finite-coefficients` and `comparison-integral`, which are package §6.6. I verified this by a breadth-first search over all packets: no prerequisite chain from any K3BlochGroups node cited by this roadmap returns to a HabiroNumberFields node.
4. **HC.5 narrowed (contract).** HabiroCyclotomicCompletions §5.5, its ordinary-versus-derived completion comparison, imports HabiroRings Layer 2, and HabiroRings consumes this roadmap. The contract now uses only HC.5's Chinese remainder decomposition (`unionEquivProd` and `comaximalComponentEquiv` in §5.2, which need only its Layers 1–4). It states that the derived comparison is not used.
5. **PadicHodgeRegulators contract (supplier contracts).** The contract now says that the D.1, D.3 and D.4 inputs, including the root-symbol values that fix the sign of D_p, must be available before this roadmap. If the supplier proves them through de Jeu's weight-two complex, that complex and its comparison with Suslin's isomorphism must also come before this roadmap, from PadicHodgeRegulators itself or from K3BlochGroups. The sentence does not name Polylogarithms, which the README may name only as a consumer. This follows the pattern of the existing "early prefix" condition on M.8. The reason is in the maintainer note below.

Suggested.lean and metadata.toml needed no change.

## Supplier edges checked

For every supplier layer the README names, I ran a breadth-first search through node prerequisites in all packets. The targets were HabiroRings, HabiroNahmSeries, ArithmeticQuantumTopology, Polylogarithms and HabiroNumberFields itself.

| Supplier layer cited | Node-level result | Package-level remark |
| --- | --- | --- |
| K3BlochGroups V.2–V.5, V.6 except §6.7 | clean | §6.7 consumes HB.1–HB.2. This is now excluded and listed as a consumer. |
| StableHomotopyKTheory H.6; GeneralAlgebraicKTheory K.2, K.3, K.7; ArithmeticKTheory N.3–N.6 | clean | — |
| MotivicEtaleKTheory M.1, M.3, M.7, M.8 | clean | Its package names this roadmap only as a consumer. |
| KTheoryFiniteLocalFields L.2, L.7 | clean (all 28 nodes) | Its Layer 5 imports the big Witt object from HabiroRings. That is a package-level cycle (maintainer note 2). |
| HabiroCyclotomicCompletions HC.1, HC.3, HC.4 | clean | — |
| HabiroCyclotomicCompletions HC.5 | only `ordinary-versus-derived-completion` reaches HabiroRings HR.2 | This comparison is now excluded. |
| QSeriesPartitionsAndMockModularForms QM.0–QM.1 | clean (154 nodes) | Its QM.5 cites ArithmeticQuantumTopology QT.3–QT.4 (maintainer note 3). |
| PolylogarithmFunctions PF.1, PF.3 | clean | No node of the design has a HabiroNumberFields or Polylogarithms prerequisite. |
| PadicHodgeRegulators D.1, D.3, D.4 | D.3 and D.4 reach `Polylogarithms:P.4` through `D.2/weight-two-dilogarithm-comparison` | The README contract now excludes this path; it is fixed in the supplier (maintainer note 1). |

Other D.1 and D.3 paths reach `Polylogarithms:P.1` through ColemanIntegration's L1/L2 nodes. P.1 is the material that now belongs to PolylogarithmFunctions, so those paths need only a citation repoint in those packets.

The README names Polylogarithms nowhere. It names HabiroRings, HabiroNahmSeries and ArithmeticQuantumTopology only in scope statements, in the conditional calibration of §1.14, or as downstream consumers. No HR or P stage id remains.

## Nothing weakened

I read the whole diff of the fix (`2e4d7defb..b3309375b`), hunk by hunk. Every change renames a supplier, adds a contract clause, or replaces an import by a new target with its own Checks. No hypothesis, Check, locator or worked example was removed. The deleted "QuantumModularity can use…" sentence named a supplier as a consumer and was wrong.

I recomputed the new targets' Checks:
- the idempotent e=(1−i⊗ζ₄)/2 and its exchange by φ⊗id at p=3;
- the factorisation x³−2≡(x−3)(x²+3x+4) mod 5, with 3 a nonsquare, giving order lcm(1,2)=2;
- Φ₃(ζ₃+x)=(2ζ₃+1)x+x² with (2ζ₃+1)²=−3;
- the p=3 nonreducedness control;
- the (11,5) and (2,3) factor counts;
- 2³≢2 in ℤ₃.

All hold. The fix's source issue is also confirmed. In Wagner, arXiv:2510.04782v2, the ℓ-completion step of the proof of Lemma 2.12 (p. 18) asserts that Φ_m is irreducible over 𝔽_ℓ whenever (m,ℓ)=1, which Φ₅ over 𝔽₁₁ contradicts. I did not reopen the thesis copy.

## Items 1–6

- **Form and size.** The form is unchanged from the accepted package. The README is 139,741 bytes, under 200 KB.
- **Fidelity.** The added §1.3 identity is the one the accepted HB.2 plan specifies, with the same neighbourhood and principal branches.
- **Own words.** No source passage was added.
- **No process.** A scan for packet, job, review, checkpoint, coverage and handoff terms found nothing.
- **Lean.** `lean-check research/blueprint/packages/HabiroNumberFields/Suggested.lean` exited 0, with only four `declaration uses 'sorry'` warnings (lines 44, 51, 72, 81). The declarations still match the README targets they name.
- **Metadata.** metadata.toml is `topic = "math.NT"`.

## For the maintainer (outside this package)

1. **PadicHodgeRegulators to Polylogarithms P.4.** The node `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison` cites `Polylogarithms:P.4`. Its request asks P.4 for de Jeu's complexes M̃^{(2)} and for the comparison of de Jeu's weight-two map with Suslin's B(F)⊗ℚ≅K₃^ind(F)⊗ℚ. `D.3/local-regulator` fixes its sign by the cyclotomic values of that comparison, and D.4 builds on D.3. With Polylogarithms ordered after this roadmap, PadicHodgeRegulators D.3–D.4 cannot precede this roadmap until that weight-two input moves down. It could move into PadicHodgeRegulators D.2 itself, or into K3BlochGroups, which D.2 already uses for the rational comparison.
2. **KTheoryFiniteLocalFields.** §5.16 imports the big Witt object "from Habiro rings", and its packet node `L.5/relative-k-of-truncated-polynomial-over-perfect-field` cites `HabiroRings:HR.4`. HabiroRings assigns big Witt vectors to QWittVectors QW.0. Repointing there would remove the package-level cycle. The L.2 and L.7 results used here are clean at node level.
3. **QSeriesPartitionsAndMockModularForms.** QM.5 cites ArithmeticQuantumTopology QT.3–QT.4, and ArithmeticQuantumTopology consumes this roadmap. QM.0–QM.1, which is all that is used here, are clean. The roadmap-level order still needs QM.5 placed after ArithmeticQuantumTopology, or split off.
4. **Packets lagging the package.** These are unchanged from the fix handoff:
   - `HabiroNumberFields.json` and `--HB.6` still cite HabiroRings HR.1 and HR.5;
   - `--HB.2` still cites `Polylogarithms:P.1`;
   - the request in `--HB.2` asks P.1 for the eight-term specialisation. PolylogarithmFunctions does not plan that specialisation. The package now derives it in §1.3 from PF.1 and PF.3 together with a Landen step owned here.

   In addition, `K3BlochGroups:V.3/goncharov-curve-boundary` still cites `Polylogarithms:P.4/specialization-and-delta`. This is reached from `V.3/convention-coefficient-exports`, which this roadmap's HB.1 uses. Its package already treats P.4 as a consumer, so only the packet edge needs repointing.

## Checks run

- lean-check, as above.
- `python3 research/blueprint/intake.py check-files` on the three changed deliverables (result in the pull request).
- `git diff --check`.
- Numerical checks of §1.3. These used independent Simpson quadrature of −∫₀¹Log(1−tz)/t dt, run with `python3 -I` from a scratch directory, and the exhaustive Abel-substitution search.
- Breadth-first searches over prerequisites in all packets.

No suspicious instruction was found in the issue, the other packages, the packets or the fetched arXiv paper.
