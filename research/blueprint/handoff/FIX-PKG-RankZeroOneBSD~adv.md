# FIX-PKG-RankZeroOneBSD~adv — checkpoint

Worker: Codex, session `codex-8kj76D`, 2026-10-19. Issue: [#10957](https://github.com/CBirkbeck/tauceti-explorer/issues/10957). Base: `ded1a70165e3d3df66d8ed847d734695148f8da8`.

The package remains **needs_changes**. This checkpoint corrects the local Tate criterion, identifies the existing elliptic-unit owner, fixes the character comparison's coefficients and local conditions, and adds five proved Lean examples. It does not certify the absent adversarial report or close the remaining arithmetic comparisons.

## Input and scope

The required `reviews/REV-PKG-RankZeroOneBSD~adv.md` is absent. The only matching tracked review is `reviews/REV-PKG-RankZeroOneBSD.md`, the earlier independent review, which was read. Searching available Git history found no version of the required report; GitHub's commits API for its exact path returned an empty array on 2026-10-19. Issue #10957 has the instructions and claim exchange, with no attached findings. The prior `FIX-PKG-RankZeroOneBSD~adv2.md` handoff records the same missing input. The maintainer was asked for its location during this run; no replacement was provided before submission. Observation labels below are local to this handoff, not invented identifiers for that report.

Read WORKERS, PROTOCOL, PACKAGE_REVIEW, UPSTREAM_GUIDE, the PadicMeasuresIwasawaAlgebras exemplar, the existing package and previous fix handoff. Inspected current upstream EllipticCurves and ClassFieldTheory and current Tau Ceti, read-only, plus the reviewed library-coverage entry. Current upstream ownership was checked at roadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No upstream files, packets, previous reviews or previous handoffs were edited.

Compilation uses the package pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Native `Padic.valuation`, its power and numeral formulas, `PowerSeries.C` and coefficient maps, and `ZMod` suffice for the new checks; no second valuation, power-series or Tate-curve construction was introduced.

## Finding dispositions

| Observation | Change and disposition |
|---|---|
| M0: required adversarial findings unavailable | **Blocked.** Supply the missing report, then reconcile its actual finding identifiers with this and the previous fix. Acceptance would otherwise assert knowledge of unseen findings. |
| M1: §10.8 identifies the local torsion hypothesis with a conjunction of two Tate-period conditions | **Corrected.** For a split Tate curve over ℚ_p with p>2, the exact local condition is that q is not a pth power. The valuation and principal-unit tests for being a pth power form a conjunction, whose negation is a disjunction. Skinner–Zhang's two conditions together are sufficient, but are not used as an equivalent replacement. The arithmetic endpoint still assumes E(ℚ_p)[p]=0 itself. Three local parameter controls are explicit; they make no assertion that q=5 is the parameter of a curve over ℚ. |
| M2: the elliptic-unit proof chain is described as having no owner | **Ownership corrected; extension still open.** CMAllPrimeMainConjectures CZ.0–CZ.3 already owns the towers, units, norm relations, Rubin comparison and Coleman/Katz direction. Import its actual targets. Request `ellipticUnitCharacterComparison` as an extension there, instead of duplicating that construction or treating Katz interpolation as the algebraic theorem. Scope, supplier contracts and Layer 11 dependencies now agree. |
| M3: the KY character comparison leaves the module, local conditions and coefficient ring implicit | **Statement corrected.** Specify θ with values in the finite residue field of O, its Teichmüller lift, M_θ with inverse tautological action, and the dual of KY's actual unramified Selmer group. The local condition at v is relaxed; at v̄ it is unramified, retaining the exceptional finite kernel. State the ideal equality after extension to Λ^nr, where the normalized Katz function lives. A Λ-valued equality would require a further descent proof. The result retains finite p-adic O, rather than narrowing it to ℤ_p. |
| M4: the trivial-character correction has only a verbal check | **Checks strengthened.** For U=1+T over ℤ₅, distinguish U, TU and 5U. The last two have different μ and λ, and different reductions modulo 5. For general O, use its uniformizer; multiplication by p changes μ by the ramification index. The new reduction example is fully proved on native power series. |
| M5: the ramified multiplicative-prime transfer still lacks an applicable auxiliary equality | **Unresolved, made precise.** Castella's §5 chooses q ramified in K; E^K is additive there. Skinner Theorem C requires a multiplicative residual-ramification prime r≠p. Neither the now-additive q nor p automatically supplies it. Retain the actual ramified differential/local comparison and an applicable rank-zero equality as explicit obligations. A one-sided auxiliary bound alone does not force equality, as the new integer example shows. |
| M6: further integral supplier obligations inherited from the previous fix | **Carried forward explicitly.** The named contracts and Mathematical boundaries remain in the README. This run does not claim to have established the integral higher-weight/error-zero refinement, ordinary/signed BSTW comparisons, KLZ/Wüthrich lattice comparisons, arbitrary ramified nonvanishing or the other source obligations inventoried by the previous handoff. No stronger export is inferred from a weaker existing target. |

## Source checks and the remaining gaps

The local Tate calculation uses the quotient ℚ_p^×/q^ℤ from EllipticCurves Layer 4's uniformization direction. For p>2, ℚ_p has no nontrivial pth roots of unity. A nonzero order-p class therefore gives a pth root of q, after adjusting the exponent modulo p. Conversely a pth root represents a nonzero order-p class, as its valuation is v_p(q)/p and cannot be an integral multiple of v_p(q). On principal units the logarithm identifies pth powers with p²ℤ_p, and the roots of unity of order dividing p−1 present no obstruction. This proves the disjunctive criterion used in the README. Castella's erratum, the remark on p.2, motivates the package's old rewrite; the corrected package keeps the group hypothesis of Theorem A′, p.1, rather than that rewrite. Skinner–Zhang Theorem1.1(b), pp.3–4, was read directly to distinguish its stronger pair of conditions.

For the remaining ramified transfer, Castella (2018), §5, pp.19–21, uses both a ramified adaptation of the period comparison (footnote 1, p.20) and an auxiliary rank-zero BSD equality. JSW v1 Theorem7.2.1(i), p.42, gives the Kato inequality. Its part (ii) points to Skinner's result; Skinner v1 Theorem C, p.3, explicitly requires a different prime r≠p of multiplicative reduction with residual ramification. Thus one cannot interpret the abbreviated JSW condition as permission to use p. In defect valuations, the product equality would say d_E+d_twist=0, while that Kato bound gives d_twist≥0. The pair (−1,1) satisfies both and does not give d_E=0. The next worker needs an applicable additional source theorem or a proved comparison producing the missing opposite bound, together with the ramified local factors; relabeling §2.10 does not do this.

For the character route, checked KY v2 §1, p.7, §1.1, p.9, Definition1.2.1, p.13, Theorem1.2.2 and its proof, p.14, and §2/Theorem2.1.3/proof of Theorem2.2.3/Remark2.2.4, pp.31–34. These distinguish the finite coefficient field, unramified local conditions, Λ^nr-valued analytic branch and trivial-character factor T. The underlying de Shalit III.1.10/Yager specialization is cited through KY; it was not independently read. Neither work is in the cleared-source index, and no other copy was obtained.

The existing `readmes/CMAllPrimeMainConjectures.md` and its packet were inspected at this clone's base. Its CZ.3 targets **katz-form-main-conjecture** and **anticyclotomic-theta-main-conjecture** supply the existing direction, but the latter assumes θ|_{G_v̄}≠1,ω and its proof records the p|h_K specialization as a gap. The new contract requests those missing cases and arbitrary finite residue coefficients as supported by KY. The rational results of CZ.4–CZ.6 cannot provide the integral coefficient-prime information. Analytic μ=0 remains with AutomorphicPadicLFunctions L3h. The maintainer should route this extension to that existing CM owner; this issue does not authorize editing its packet.

Fetched primary sources, accessed 2026-10-19; hashes identify the exact PDFs read. All new repository prose is in our own words.

| Source | Locator read | SHA-256 |
|---|---|---|
| [Castella erratum](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf) | Theorem A′ and remarks, pp.1–2; corrected Theorem1.1 | `c04dff16c27bc3ca4f4e235e366fcd4c95a43cfb9215f75a2584dfeb7114edcf` |
| [Castella 2018](https://web.math.ucsb.edu/~castella/Birch-print.pdf) | §5, pp.19–21, especially p.20 footnote 1 | `b16939c1c713aa572c54eff0ed511cb63087b726051eae6538058d75fabdd959` |
| [Skinner–Zhang v1](https://arxiv.org/pdf/1407.1099v1) | Theorem1.1(b) and discussion, pp.3–4 | `50123dc1fb271f610f02c8b38527873a8b382f346994074e7db8aae6a00f5412` |
| [Skinner v1](https://arxiv.org/pdf/1407.1093v1) | Theorem C, p.3; §2.2 Tate-period example, p.7 | `02d176d8fd52b0159eecb448f4bea89bd29bdf73f3095a686d52ad96c0a9b988` |
| [JSW v1](https://arxiv.org/pdf/1512.06894v1) | Theorem7.2.1, pp.42–43 | `908562efdddaf46b2653317294cb65ae627802bc996400a779b1cd51b5a7d49d` |
| [Keller–Yin v2](https://arxiv.org/pdf/2402.12781v2) | Coefficients and character definitions, pp.7,9,13–14; analytic comparison, pp.31–34 | `bb64820b49aa1eb2574c912c0d03067f904e52b9bf71f441fda78bb6dba9c90a` |

## Adversarial pass on the changed statements

| Statement or interface | Instances tried | Result and change |
|---|---|---|
| §10.8 endpoint hypotheses | p=2,3; good versus multiplicative p; absent nonsplit q; local torsion present | These fail explicit hypotheses. The endpoint's hypotheses were preserved; the broader 2018 endpoint is not restored. Its proof dependency remains open. |
| Local Tate criterion | q=0; q=1; p=2; p=5 with q=5,5⁵,5⁵·6 | Zero and norm-one parameters are outside 0<|q|<1. At p=2 the roots-of-unity argument fails, so p>2 is retained. The three valid parameters separate valuation and unit obstructions. |
| First new p-adic example | x=0 and arbitrary x∈ℚ₅ in x⁵=5 | Taking native integer valuations would give 5v₅(x)=1, impossible. The totalized zero convention cannot make x=0 a root. Fully proved in Lean. |
| Second new p-adic example | x=5, parameter 3125 | Explicit fifth power, of positive valuation; detects the incorrect positivity-only criterion. Fully proved in Lean. |
| Third new p-adic example | All 25 residues, including zero and nonunits; parameter 5⁵·6 | Exhaustive finite check gives no fifth root of 6 modulo 25. Native p-adic valuation of the parameter is 5. These are the ingredients of the README's local obstruction, not a Lean construction of a Tate curve. Fully proved in Lean. |
| Ramified transfer contract | (d_E,d_twist)=(0,0),(−1,1); q ramified versus split | Zero pair passes; nonzero pair satisfies the product relation and only one bound. Ramifying q removes the multiplicative witness used by the unramified route. Contract now states the missing equality/opposite bound explicitly. Integer negative control fully proved in Lean. |
| CM ownership and range | Nonexceptional θ; θ=1; θ locally ω; p|h_K; p=3 | Existing CZ.3 handles only its named range, with the class-number gap recorded. The remaining cases are requests, not claimed exports. Odd p=3 is not silently excluded from the KY request. |
| Actual character Selmer group | Strict versus unramified at v̄; zero or arbitrary unrelated module; trivial Γ | The module is tied to KY's Galois construction, not quantified as an arbitrary torsion module. Exceptional finite local kernels are retained. Γ is the actual anticyclotomic ℤ_p-extension, so T=0 from a trivial Γ is outside scope. |
| Character coefficient rings | O=ℤ₅; larger finite residue field; ramified O; p inverted | Finite O is retained. Katz ideals are compared in Λ^nr. Uniformizer μ differs from p-adic μ by ramification; rationalization would erase that distinction. Unramified scalar extension preserves the stated invariants componentwise. |
| Trivial-character augmentation | U=1+T, TU, 5U; zero series; unit ideal | U is a unit; TU has λ=1 and μ=0; 5U has λ=0 and μ=1 over ℤ₅. Zero series is outside the nonzero characteristic generator comparison. No claim that every nontrivial Katz branch is a unit. |
| New power-series example | Coefficient field ℤ/5; constant and linear coefficients; augmentation versus uniformizer | Modulo 5, the uniformizer multiple is zero while the augmentation multiple has linear coefficient one. Fully proved on native `PowerSeries`, with no Iwasawa carrier substituted by an artificial model. |

The five new Lean examples have no added arithmetic hypotheses or `sorry`s. The preexisting theorem signatures and their variable blocks are unchanged. No definition or construction was added, and all 140 numbered README targets and their prior definition Checks remain present. The previous handoff's comprehensive audit is inherited, not represented as a fresh review of unchanged statements in this run.

## Validation

- `lean-check research/blueprint/packages/RankZeroOneBSD/Suggested.lean`: exit 0, exactly 21 warnings, all declarations using `sorry`; zero errors and no other warnings. Five new examples have complete proofs. File length: 347 lines.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/RankZeroOneBSD/Suggested.lean`: passed.
- `python3 scripts/check_blueprint.py` on `RankZeroOneBSD--BSD.0.json`, `RankZeroOneBSD--BSD.7.json`, and `RankZeroOneBSDPartII.json`: each 0 errors, 0 warnings. Packets unchanged.
- `python3 research/blueprint/intake.py check-files` on these four deliverables: 4 files, 0 problems.
- `git diff --check`: passed. Only the three authorized package files and this handoff changed. No source passages, private paths, sorry-valued data, new construction development or compiler processes are left by this submission.

## Resuming the job

First provide the absent adversarial report and reconcile its findings. Then establish the ramified auxiliary transfer and the exceptional-character integral comparison described above, or replace each with a verified applicable source route. Consult the previous fix's handoff and the README's named supplier contracts for the remaining inherited integral/source obligations. Keep `needs_changes` until those obligations and every actual adversarial finding can be certified. This checkpoint is one job; no second issue was claimed.
