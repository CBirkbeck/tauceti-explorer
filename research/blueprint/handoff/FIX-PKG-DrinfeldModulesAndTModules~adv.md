# Drinfeld package supplier fixes — checkpoint

Issue [#11519](https://github.com/CBirkbeck/tauceti-explorer/issues/11519), job `FIX-PKG-DrinfeldModulesAndTModules~adv`. Codex, session `codex-qwnUzQ`, 2026-10-20. Claim confirmed by the bot in comment 6302314131. **Checkpoint: two supplier findings resolved; the finite-fields supplier remains blocked.** The package verdict is `needs_changes`, not upstream acceptance.

## Findings and dispositions

The advertised report `REV-PKG-DrinfeldModulesAndTModules~adv.md` does not exist in this checkout. The available completed report is [REV-PKG-DrinfeldModulesAndTModules~codex1.md](../reviews/REV-PKG-DrinfeldModulesAndTModules~codex1.md). Its mathematical repairs are already in the starting package and are preserved. Its remaining findings concern three suppliers.

| Finding | Change and evidence | Disposition |
| --- | --- | --- |
| ReductiveGroupsPartII RG2.0a.2 and RG2.3.7 are not merged, so the earlier review could not accept them as suppliers. The finite nonreduced coefficient case must be covered. | The fix issue expressly authorizes consuming roadmaps in open upstream PRs. Read both README and Suggested.lean at [PR #785](https://github.com/TauCetiProject/TauCetiRoadmap/pull/785), head `0d37c3f452ad9769ad7bfc257b5f283091814d85` (open, non-draft when inspected). The exact supplier section now imports finite-locally-free Weil restriction, including finite nonreduced coefficient algebras, and geometric-point Lang surjectivity. Section 1.3 verifies its own specialized group is smooth geometrically connected and explains the passage to arbitrary separably closed fields. | Resolved under the issue's explicit open-PR instruction. No general Weil-restriction or Lang theory is replanned. |
| MotivesAndAlgebraicCycles §§6.1–6.3 are not merged; the required reconstruction is over the imperfect field F_q(t). | Read both files at [PR #1313](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1313), head `c3dad319dd28b8dec9dca85265421575049bd5dc` (open draft when inspected). The supplier section now specifies the essentially small rigid abelian symmetric category, scalar endomorphisms of the unit, exact faithful linear symmetric fibre functor, reconstruction on all algebras, and both functor criteria with their direction. It explicitly permits arbitrary fields. Section 8.21 applies the imported generated-subcategory construction to pre-t-motives and their analytic realization. | Resolved under the same instruction. The characteristic-zero connectedness criterion is explicitly unused. |
| No upstream supplier for the four elementary FiniteFieldsAndCharacterSums contracts. | Rechecked the reviewed library audit, the finite-fields packet and separate Ore-comparison follow-up, the supplied current roadmaps/library, and upstream PR searches by roadmap name, finite-fields title and polynomial terminology. No upstream PR supplying these contracts was found. The parent finite-fields packet already assigns its linearized-polynomial foundations to FF.0 while retaining legacy FF.4 IDs; its comparison follow-up still needs the corresponding parent-stage coordination. The existing import is retained, with no duplicate local construction. | **Unresolved ownership/availability blocker.** See the precise resume instructions below. |
| The earlier review recorded a 200 KB issue-template cap in tension with the later shape rule. | This fix issue has no 200 KB cap. PACKAGE_REVIEW's later rule requires preserving the full mathematical content. All 137 numbered targets, all 137 Checks lists, all explicit anchors, the hypotheses and source locators remain. | No content was removed to meet an obsolete cap. |

## Additional corrections within those contracts

The upstream Lang target supplies surjectivity on algebraically closed points, not the finite-étale morphism assertion previously attributed to it. Section 1.3 now obtains scheme surjectivity from that finite-type geometric-point statement and proves the finite étale fibres needed for descent: the differential of Frobenius vanishes, the differential of the Lang map is invertible, and each fibre is a finite-type zero-dimensional étale scheme over the coefficient field. Nonempty finite étale schemes have points over a separably closed field. This does not assume the field is perfect.

For a finite commutative F-algebra D, the group Res_(D/F) GL_r is the principal open of affine matrix space defined by the norm of the determinant. Its value at the identity is one, so the open remains nonempty and irreducible after algebraic closure, even when D is nonreduced. This checks the imported Lang hypotheses in precisely the case torsion needs. The argument extends Hartl's A/I case to any finite commutative coefficient algebra without adding a second general group-scheme construction.

The twist on D tensor L is now explicitly id_D tensor Frob_L. Absolute q-power on this ring is a different operation. The right Lang convention B sigma(B)^(-1) gives exactly Phi sigma(B) = B. Two solutions differ on the right by GL_r(D). The fixed module is B D^r, isomorphic to D^r, with the claimed scalar-extension comparison; numerical rank r is asserted for nonzero D. Applying forward Frobenius to the inverse-twist equation uses coefficient sigma(Phi); inverse twisting still requires perfection. The general semilinear convention no longer describes the imperfect-field forward Frobenius as an automorphism.

Suggested.lean adds only two theorem signatures on existing carriers: `semilinear_lang` and `semilinear_lang_finiteAlgebra`. Both assume an invertible determinant and a separably closed coefficient field. Neither introduces a data carrier or an admitted definition. Eight new proved examples check identity matrices (including size zero), a two-by-two unipotent equation, the F_3 and F_2 counterexamples, singular rank one, the two tensor factors of coefficient Frobenius, and the dual-number nilpotent. The file still imports only Mathlib.

## Adversarial pass on changed statements

These checks concern the revised contracts, conventions, §1.3 and §8.21. The earlier report's pass on the other targets remains recorded there; it is not represented here as a new independent re-review of those unchanged results.

| Statement | Instances/computation | Result and change |
| --- | --- | --- |
| Finite field and Frobenius hypotheses | A field cannot have q = 1. Checked q = 2 and q = 3; Algebra F L supplies the required characteristic. | No artificial q = 1 branch or characteristic-zero use. |
| Field Lang equation | r = 0 gives the unique empty matrix, determinant one. Phi = 1 has B = 1 in every size. | Rank zero is explicit in the README; the generic identity example covers it. |
| Invertible linearization | For rank one and Phi = 0, the equation forces B = 0. Frobenius on F(u)^sep has an invertible linearization but is not surjective as a set map. | Determinant-unit hypotheses retained in both signatures; singular negative control proved. Perfection is not added to the forward theorem. |
| Separable closedness | Over F_3, 2b^3 = b forces b = 0. Over F_2, the invertible matrix ((0,1),(1,1)) has characteristic polynomial X²+X+1 and no nonzero fixed vector. | Both finite computations are README checks and proved Lean examples; the q = 2 case avoids the vacuous condition a != 1 in F_2^*. |
| Matrix direction and sign | B = ((1,x),(0,1)), Phi = ((1,x-x^q),(0,1)) gives Phi B^[q] = B. With x-x^q nonzero, a constant permutation matrix need not commute with Phi. | Two-term matrix equation proved in Lean and stated in the README; right multiplication is the uniqueness action. |
| Weil restriction over nonreduced coefficients | D = F[epsilon]/epsilon² gives a nonempty open in affine 2r²-space. For r = 1, Phi = 1+epsilon a and B = 1+epsilon b, the equation reduces to b-b^q = a. Its derivative is one. | No étaleness or reducedness of D is assumed. Only finite-dimensionality over F is needed. |
| Which tensor factor is twisted | sigma_D(d tensor 1) = d tensor 1 and sigma_D(1 tensor c) = 1 tensor c^q. For D = F_2[epsilon], epsilon² = 0 but epsilon != 0. | Pure-tensor identities and epsilon² != epsilon proved in Lean; README distinguishes coefficient and absolute Frobenius. |
| Split coefficient fields | For D = F_(q²), after splitting D tensor L as L × L, sigma_D exchanges the two factors while taking q-th powers. Its fixed algebra is D, not F × F under componentwise absolute Frobenius. | Confirms that the basis-of-D argument handles finite extensions as well as nilpotents. |
| Fixed module and unit ideal | Expanding coefficients in an F-basis of D reduces fixedness to c^q = c in L. D = F recovers the field theorem; D = 0 (in particular I = A) gives the trivial group and zero module, without a numerical-rank assertion. | The rank statement is over D; the unit-ideal case is separated explicitly. A DVR hypothesis is neither present nor needed; D is finite Artinian, while L remains a field. |
| Lang supplier strength | The source target is on geometric points. Smoothness and connectedness are checked for the actual restricted GL_r; invertible differential yields étale fibres. | Removed the unjustified attribution of finite étaleness to RG2.3.7. Hartl Proposition 6.5 and Milne Corollary 27.55 support the specialized bridge. |
| Inverse twist | Applying sigma to B^(-1 twist) = Phi B gives B = sigma(Phi) sigma(B). Over an imperfect separably closed field inverse Frobenius is unavailable. | Correct coefficient and perfectness requirement retained. No inverse-twist declaration is asserted under the weaker Lean hypotheses. |
| General neutral Tannaka | The unit category gives the trivial group; graded vector spaces give G_m. At characteristic two, mu_2 has infinitesimal points that cannot be recovered from field-valued points alone. F_q(t) is imperfect. | The import is on all coefficient algebras over any field and includes ordinary symmetry. No characteristic-zero connectedness theorem is used. |
| Functor criteria | Restriction along mu_2 into G_m illustrates the closed-immersion direction and failure of fullness; the map for U:D→C is G_C→G_D. | Full faithfulness plus ambient-subobject closure is used for faithful flatness; subquotients of image objects are used for a closed immersion. Existing §§8.35 and 8.48 use these directions consistently. |
| Generated pre-t-motive category | The unit generates its finite sums; Carlitz generates all its integral tensor powers including duals; even characters in Rep(G_m) do not generate an odd character. Zero object and empty family generate only the unit hull. | All three existing Checks retained. General generation is imported; the local target records its pre-t-motive and analytic compatibility. No new cycle: §8.20 does not depend on §8.21. |

## Source access and library checks

Public PDFs accessed on 2026-10-20; only paraphrases and locators occur in the package and this note.

| Source | Passages read for this fix | SHA-256 |
| --- | --- | --- |
| [Hartl, arXiv:1706.06807v1](https://arxiv.org/pdf/1706.06807v1) | Proposition 6.5 and proof, p. 26; adjacent Theorem 6.6 for the torsion use. | `bca3f51ed9bf5f215a12bdf2390b4718cb3a951a3e71c01fb87541fefafcd31f` |
| [Milne, Algebraic Groups v2.00](https://www.jmilne.org/math/CourseNotes/iAG200.pdf) | Proposition 27.54, p. 487; Corollaries 27.55–27.56 and the disconnected counterexample, p. 488. | `385dd0d5a65db056b5b1e5b15ec799245991b934ed308035dbe95375de8a0069` |
| [Deligne–Milne, Tannakian Categories, 2018 revision](https://www.jmilne.org/math/xnotes/tc2018.pdf) | Theorem 2.11 and its field hypotheses, pp. 21–24; Definition 2.19 and Propositions 2.20–2.21, pp. 25–26. | `fab326945330dcf45960fdac1eef59fd91465cede4ffbc2fdb7c3cd77b3c3753` |

Read the reviewed DM.0–DM.8 and FF.4 library-audit entries. Rechecked pinned Mathlib's `FiniteField.frobeniusAlgHom`, `IsSepClosed`, tensor-product maps and dual numbers. Searched the pinned and supplied current libraries and current roadmap Lean files by the relevant objects (linearized/Ore polynomial composition, Frobenius matrix descent and general Tannaka). No existing exact semilinear matrix milestone or replacement supplier for the missing polynomial theory was found. Known-Hopf-algebra reconstruction in current Tau Ceti does not replace general neutral-category reconstruction. No build was run in the supplied read-only roadmap environment.

No suspicious instruction was encountered in the source or supplier material. Upstream files were treated as mathematical data; no commands from them were executed. No restricted-library source was needed.

## Validation

- `lean-check research/blueprint/packages/DrinfeldModulesAndTModules/Suggested.lean`: exit 0 at the shared Mathlib `082e2d37e8` / Tau Ceti `f790474` build; 684 lines, 25 `sorry` warnings only, no errors or other warnings. Every example is proved.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/DrinfeldModulesAndTModules/Suggested.lean`: passes.
- `python3 scripts/check_blueprint.py research/blueprint/packets/DrinfeldModulesAndTModules.json`: 0 errors, 0 warnings. Its 18 recorded gaps and 13 requests are unchanged; this structural check is not evidence that the supplier blocker is solved.
- Target/anchor comparison with the starting package: 137 numbered targets before and after; all 137 Checks lists and all explicit anchors retained.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 4 files, 0 problems. `git diff --check`: passes.

## Resume here

The exact remaining imported contracts are:

1. `frobenius-ore-polynomial-comparison`: the additive bijection from R{tau} to q-linearized polynomials over every commutative F-algebra R, identifying Ore multiplication with composition; the natural additive-group action, not merely evaluation on one finite set.
2. `linearized-polynomial-eval-linear`: F-linearity of evaluation in a compatible commutative R-algebra, without replacing the rings by fields.
3. `linearized-polynomial-separable-iff`: over a field, a nonzero q-linearized polynomial is separable iff its X-coefficient is nonzero, and then has q^(tau-degree) distinct roots after splitting.
4. `subspace-polynomial-is-linearized`: for every finite F-subspace U of a field, the product of X-u over U is q-linearized of q-degree dim_F U, with the zero subspace giving X.

These are used throughout DM.0, DM.2, DM.4 and DM.1, with further consumers through those layers. The finite-fields parent packet owns their supporting linearized-polynomial definition, composition, roots and subspace-polynomial API in FF.0 (legacy FF.4 identifiers). Its separate comparison follow-up still needs the early-layer parent-stage update. The Caraiani–Newton order's move of FF.1 to AnalyticNumberTheory does not move these contracts.

Finish by establishing an upstream supplier for that early foundation, or by obtaining and recording a single ownership/bundle decision and coordinating the finite-fields packet/follow-up and its consumers. A transfer cannot leave the existing FF target owners in place. WORKERS says “Edit only the files the issue names,” and PROTOCOL §15 says “A proposed roadmap never restates what another roadmap plans.” This issue names no finite-fields deliverables. I asked the user whether to authorize a downward transfer; no answer had arrived when this checkpoint was prepared. Accordingly no ownership transfer or foreign-file edit is claimed, and the package remains `needs_changes` with precisely this residue.

Once that supplier/ownership decision is implemented, recheck its exact four contracts and remove this sole remaining acceptance blocker. No further claim was taken in this run.
